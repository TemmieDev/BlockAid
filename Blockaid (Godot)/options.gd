extends Control

@onready var selectsfx = $AudioStreamPlayer2D

func _on_back_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_video_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().change_scene_to_file("res://video_options.tscn")


func _on_audio_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().change_scene_to_file("res://audio_options.tscn")
