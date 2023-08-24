extends Control

@onready var selectsfx = $AudioStreamPlayer2D

func _on_play_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().change_scene_to_file("res://main.tscn")
	


func _on_options_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().change_scene_to_file("res://options.tscn")


func _on_quit_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().quit()

