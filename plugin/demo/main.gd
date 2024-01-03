extends Control


func _on_Button_pressed():
	FirebaseAnalytics.logEvent("test",
				{
					"value1_lol": 1,
					"value2_lol": "2",
					"value3_lol": 0.1
				})
