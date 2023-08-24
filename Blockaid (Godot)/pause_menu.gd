extends ColorRect

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = find_child("ResumeButton")
@onready var quit_button: Button = find_child("QuitButton")

func _ready():
	play_button.pressed.connect(unpause)

func unpause():
	animator.play("Unpause")
	get_tree().paused = false
	play_button.disabled = true
	quit_button.disabled = true

func pause():
	animator.play("Pause")
	get_tree().paused = true
	play_button.disabled = false
	quit_button.disabled = false




func _on_quit_button_pressed():
	unpause()
	get_tree().change_scene_to_file("res://menu.tscn")
