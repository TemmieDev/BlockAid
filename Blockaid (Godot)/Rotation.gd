extends Node2D

@export var rotation_speed = 0.08
var mousePos = Vector2()
const DEG2RAD = PI / 180.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	mousePos = get_global_mouse_position()
	var targetDir =get_angle_to(mousePos - position.normalized())
	rotation += sin(targetDir * rotation_speed)
	
	if rotation >= 90 * DEG2RAD or rotation <= -90 * DEG2RAD:
		scale.y = -1 
	else:
		scale.y = 1 
