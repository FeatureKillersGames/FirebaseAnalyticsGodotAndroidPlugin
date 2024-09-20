@tool
class_name FirebaseAnalyticsEditorPlugin
extends EditorPlugin

# A class member to hold the editor export plugin during its lifecycle.
var export_plugin : AndroidExportPlugin
const FIREBASE_DEPENDENCIES := """\n    \
//Firebase dependencies\n    \
implementation platform("com.google.firebase:firebase-bom:33.3.0")\n    \
implementation "com.google.firebase:firebase-analytics"\n    \
implementation "com.google.android.gms:play-services-measurement-api:22.1.0"
"""
const FIREBASE_PLUGINS := """\n    \
//Firebase plugins\n    \
id 'com.google.gms.google-services'
"""
const FIREBASE_PLUGINS_ROOT := """\n        \
//Firebase plugins\n        \
id 'com.google.gms.google-services' version '4.4.2' apply false
"""


func _enter_tree():
	# Initialization of the plugin goes here.
	export_plugin = AndroidExportPlugin.new()
	add_export_plugin(export_plugin)
	# add_autoload_singleton("FirebaseAnalytics", "plugin.gd")


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_export_plugin(export_plugin)
	remove_autoload_singleton("FirebaseAnalytics")
	export_plugin = null


func _disable_plugin() -> void:
	_cleanup_plugin()

static func _cleanup_plugin() -> void:
	if FileAccess.file_exists("res://android/build/build.gradle"):
		var file := FileAccess.open("res://android/build/build.gradle", FileAccess.READ)
		var file_text := file.get_as_text()
		file.close()
		file_text = file_text.replace(FIREBASE_PLUGINS, "").replace(FIREBASE_DEPENDENCIES, "")
		file = FileAccess.open("res://android/build/build.gradle", FileAccess.WRITE)
		file.store_string(file_text)
		file.close()

	if FileAccess.file_exists("res://android/build/settings.gradle"):
		var file := FileAccess.open("res://android/build/settings.gradle", FileAccess.READ)
		var file_text := file.get_as_text()
		file.close()
		file_text = file_text.replace(FIREBASE_PLUGINS_ROOT, "")
		file = FileAccess.open("res://android/build/settings.gradle", FileAccess.WRITE)
		file.store_string(file_text)
		file.close()


class AndroidExportPlugin extends EditorExportPlugin:
	var _plugin_name = "FirebaseAnalyticsGodotPlugin"

	func _export_begin(features: PackedStringArray, is_debug: bool, path: String, flags: int) -> void:
		if features.has("android"):
			if not get_option("gradle_build/use_gradle_build")\
				or not FileAccess.file_exists("res://android/build/google-services.json"):
				FirebaseAnalyticsEditorPlugin._cleanup_plugin()
				return
			var file := FileAccess.open("res://android/build/build.gradle", FileAccess.READ)
			var file_text := file.get_as_text()
			file.close()
			var replace_file := false
			if not "//Firebase dependencies" in file_text:
				file_text = file_text.replace("implementation \"androidx.fragment:fragment:$versions.fragmentVersion\"\n",
						"implementation \"androidx.fragment:fragment:$versions.fragmentVersion\"\n" + FIREBASE_DEPENDENCIES)
				replace_file = true
			if not file_text.contains("//Firebase plugins"):
				file_text = file_text.replace("id 'org.jetbrains.kotlin.android'\n",
						"id 'org.jetbrains.kotlin.android'\n" + FIREBASE_PLUGINS)
				replace_file = true
			if replace_file:
				file = FileAccess.open("res://android/build/build.gradle", FileAccess.WRITE)
				file.store_string(file_text)
				file.close()

			file = FileAccess.open("res://android/build/settings.gradle", FileAccess.READ)
			file_text = file.get_as_text()
			file.close()
			replace_file = false
			if not file_text.contains("//Firebase plugins"):
				file_text = file_text.replace(
						"id 'org.jetbrains.kotlin.android' version versions.kotlinVersion\n",
						"id 'org.jetbrains.kotlin.android' version versions.kotlinVersion\n"
						+ FIREBASE_PLUGINS_ROOT)
				replace_file = true
			if replace_file:
				file = FileAccess.open("res://android/build/settings.gradle", FileAccess.WRITE)
				file.store_string(file_text)
				file.close()


	func _supports_platform(platform):
		if platform is EditorExportPlatformAndroid:
			if not get_option("gradle_build/use_gradle_build"):
				push_warning("Firebase Analytics not added cause you don't use grudle build")
				return false
			if not FileAccess.file_exists("res://android/build/google-services.json"):
				push_warning("Firebase Analytics not added cause file res://android/build/google-services.json not founded")
				return false
			return true
		return false


	func _get_android_libraries(platform, debug):
		if debug:
			return PackedStringArray([_plugin_name + "/bin/debug/" + _plugin_name + "-debug.aar"])
		else:
			return PackedStringArray([_plugin_name + "/bin/release/" + _plugin_name + "-release.aar"])


	func _get_name():
		return _plugin_name
