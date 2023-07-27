extends Node2D


signal player_fired_bullet(bullet)

var bullet = preload("res://bubble.tscn")

@onready var end_of_gun = $EndofWeapon

func _unhandled_input(event):
	if event.is_action_released('shoot'):
		shoot()
		
func shoot():
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = end_of_gun.global_position
	var target = get_global_mouse_position()
	var direction_to_mouse = bullet_instance.global_position.direction_to(target)
	bullet_instance.set_direction(direction_to_mouse)
	emit_signal("player_fired_bullet", bullet_instance)
