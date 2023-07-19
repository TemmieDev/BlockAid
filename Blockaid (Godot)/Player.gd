extends CharacterBody2D
@export var rotation_speed = 0.08
@export var player_speed = 500
@export var friction = 0.5

var mousePos = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	mousePos = get_global_mouse_position()
	var targetDir =get_angle_to(mousePos - position.normalized())
	rotation += sin(targetDir * rotation_speed)
	
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	direction = direction.normalized()

	
	velocity = velocity.lerp(direction * player_speed, 0.1)
	velocity *= 1.0 - (friction * delta)
	
	
	move_and_slide()