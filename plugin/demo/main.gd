extends Control


func _on_Button_pressed():
	FirebaseAnalytics.logEvent("test",
				{
					"value1": 1,
					"value2": "2",
					"value3": 0.1
				})

	FirebaseAnalytics.setUserProperty("test_property", "test")
