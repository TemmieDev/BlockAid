extends Control


func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func set_survived(value):
	$Panel/TimeSurvived.text = "Time Survived: " + str(floor(value))

func set_high_score(value):
	$Panel/HighScore.text = "Highscore: " + str(floor(value))

func _on_menu_button_pressed():
	get_tree().quit()
