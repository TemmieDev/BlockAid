extends Control

@onready var display_options = $HBoxContainer/Display
@onready var resolution_options = $HBoxContainer2/Resolution
@onready var selectsfx = $AudioStreamPlayer2D

func _ready():
	display_items()
	resolution_items()

func display_items():
	display_options.add_item('FullScreen')
	display_options.add_item('Borderless')
	display_options.add_item('Windowed')

func resolution_items():
	resolution_options.add_item('3840x2160')
	resolution_options.add_item('2560x1440')
	resolution_options.add_item('1920x1080')
	resolution_options.add_item('1600x900')
	resolution_options.add_item('1280x800')
	resolution_options.add_item('1280x720')

func _on_back_pressed():
	selectsfx.play()
	await selectsfx.finished
	get_tree().change_scene_to_file("res://options.tscn")



func _on_resolution_item_selected(index):
	var current_selected = index
	if current_selected == 0:
		DisplayServer.window_set_size(Vector2(3840, 2160))
	if current_selected == 1:
		DisplayServer.window_set_size(Vector2(2560, 1440))
	if current_selected == 2:
		DisplayServer.window_set_size(Vector2(1920, 1080))
	if current_selected == 3:
		DisplayServer.window_set_size(Vector2(1600, 900))
	if current_selected == 4:
		DisplayServer.window_set_size(Vector2(1280, 800))
	if current_selected == 5:
		DisplayServer.window_set_size(Vector2(1280, 720))


func _on_display_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	if current_selected == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if current_selected == 2:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
