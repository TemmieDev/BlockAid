extends Node2D

@export var rotation_speed = 0.3
var mousePos = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	mousePos = get_global_mouse_position()
	var targetDir =get_angle_to(mousePos - position.normalized())
	rotation += sin(targetDir * rotation_speed)
