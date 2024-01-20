# Firebase Analytics Godot Android Plugin
Firebase Analytics implementation for Godot 4.2+. Created from [Godot Android Plugin template](https://github.com/m4gr3d/Godot-Android-Plugin-Template).

### Instaling the plugin
For use plugin you must configure gradle build as covered in [godot docs](https://docs.godotengine.org/en/stable/tutorials/export/android_gradle_build.html)
- Download addon from releases to addons folder of your project
- Navigate to Project -> Project Settings... -> Plugins, and ensure the plugin is enabled
- Install the Godot Android build template by clicking on Project -> Install Android Build Template...
- Add your [google-services.json](https://developers.google.com/android/guides/google-services-plugin) to android/build folder in your project 
- Connect an Android device to your machine and run your project

## Usage
Download latest release and enable plugin in godot project settings.
For log event use function in singleton FirebaseAnalytics: 
```gdscript
func logEvent(event: String, params: Dictionary) -> void:
```
In params dictionary keys mast be String type, values can be int, float or String.
Usage example:
```gdscript
func _on_Button_pressed():
    FirebaseAnalytics.logEvent("test",
        {
            "value1": 1,
            "value2": "2",
            "value3": 0.3
	})
```
Plugin store [google recomended events](https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event) names as constatns that you can use:

![image](https://github.com/FeatureKillersGames/FirebaseAnalyticsGodotAndroidPlugin/assets/36816595/698b04a2-6aa7-4bf9-b1cc-7c7673357fb0)

And [google recomended parameters](https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param)

![image](https://github.com/FeatureKillersGames/FirebaseAnalyticsGodotAndroidPlugin/assets/36816595/17fc75b7-f0fa-46d7-8faa-517500f21733)

### Building the plugin
- In a terminal window, navigate to the project's root directory and run the following command:
./gradlew assemble
- On successful completion of the build, the output files can be found in
  [plugin/demo/addons](plugin/demo/addons)

### Warning
I use some workaround to connect android plugins to the project, so if you know how to do it properly be free to contribute or send me some guides on how to do it properly.
