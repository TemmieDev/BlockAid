extends Node2D

@export var bullet = preload("res://bullet.tscn")
@onready var end_of_weapon = $EndofWeapon

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var bullet_instance = bullet.instantiate()
	add_child(bullet_instance)
	bullet_instance.global_position = end_of_weapon.global_position
	var target = get_global_mouse_position()
	var direction_to_mouse = target - bullet_instance.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)
