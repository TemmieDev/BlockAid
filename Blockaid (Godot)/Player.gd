extends CharacterBody2D
@export var rotation_speed = 0.08
@export var player_speed = 500
@export var friction = 0.5
@export var dash_speed = 2
@export var dash_cooldown = 0


var dash_duration = 0.5
var dash_timer = 0
var mousePos = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	mousePos = get_global_mouse_position()
	var targetDir =get_angle_to(mousePos - position.normalized())
	rotation += sin(targetDir * rotation_speed)
	
	# Directional Movement
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	direction = direction.normalized()
	
	var is_player_moving = direction.length() > 0
	
	
	velocity = velocity.lerp(direction * player_speed, 0.1)
	velocity *= 1.0 - (friction * delta)
	
	
	move_and_slide()

# Dash
	dash_cooldown -= delta
	if Input.is_action_pressed("dash") and dash_timer <= 0 and dash_cooldown <= 0:
		if not is_player_moving:
			velocity = mousePos - position
			velocity = velocity.normalized() * player_speed * dash_speed
		dash_timer = dash_duration
		player_speed *= dash_speed
		dash_cooldown = 5
		$DashParticle.emitting = true
		
		
		
	
	if dash_timer > 0:
		dash_timer -= delta
		if dash_timer <= 0:
			player_speed /= dash_speed
	
	

		
		
