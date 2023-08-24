extends Control

@onready var selectsfx = $AudioStreamPlayer2D


func _on_back_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().change_scene_to_file("res://options.tscn")





