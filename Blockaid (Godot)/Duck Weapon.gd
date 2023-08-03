extends Node2D

@export var bullet = preload("res://bullet.tscn")
@onready var end_of_weapon = $EndofWeapon

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var bullet_instance = bullet.instantiate()
	add_child(bullet_instance)
