package com.featurekillers.plugin.android.firebase.analytics

import android.app.Activity
import android.util.Log
import android.view.View
import android.widget.Toast
import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin
import org.godotengine.godot.plugin.UsedByGodot
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.analytics.ktx.analytics
import com.google.firebase.ktx.Firebase

class GodotAndroidPlugin(godot: Godot): GodotPlugin(godot) {

    override fun getPluginName() = BuildConfig.GODOT_PLUGIN_NAME
    private lateinit var firebaseAnalytics: FirebaseAnalytics
    override fun onMainCreate(activity: Activity?): View? {
        // Obtain the FirebaseAnalytics instance.
        firebaseAnalytics = Firebase.analytics
        return super.onMainCreate(activity)
    }

    @UsedByGodot
    private fun helloWorld() {
        runOnUiThread {
            Toast.makeText(activity, "Hello World", Toast.LENGTH_LONG).show()
            Log.v(pluginName, "Hello World")
        }
    }
}
