package com.featurekillers.plugin.android.firebase.analytics

import android.app.Activity
import android.view.View
import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin
import org.godotengine.godot.plugin.UsedByGodot
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.analytics.ktx.analytics
import com.google.firebase.analytics.logEvent
import com.google.firebase.ktx.Firebase
import org.godotengine.godot.Dictionary

class GodotAndroidPlugin(godot: Godot): GodotPlugin(godot) {

    override fun getPluginName() = BuildConfig.GODOT_PLUGIN_NAME
    private lateinit var firebaseAnalytics: FirebaseAnalytics

    override fun onMainCreate(activity: Activity?): View? {
        // Obtain the FirebaseAnalytics instance.
        firebaseAnalytics = Firebase.analytics
        return super.onMainCreate(activity)
    }

    @UsedByGodot
    private fun logEvent(event: String, params: Dictionary) {
        firebaseAnalytics.logEvent(event) {
            for (i in params){
                when (val value: Any = i.value as Any) {
                    is Long -> {
                        param(i.key, value)
                    }

                    is Int -> {
                        param(i.key, value.toLong())
                    }

                    is String -> {
                        param(i.key, value)
                    }

                    is Double -> {
                        param(i.key, value)
                    }
                }
            }
        }
    }
}
