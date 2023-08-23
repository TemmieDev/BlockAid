extends CharacterBody2D
	
@export var player_speed = 350
@export var friction = 0.5
@export var dash_speed = 2.5
@export var dash_cooldown = 0
var playermoving = false

var dash_duration = 0.5
var dash_timer = 0

var health: int = 4 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	
	# Directional Movement
	var direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	direction = direction.normalized()
	
	var is_player_moving = direction.length() > 0
	
	if is_player_moving:
		playermoving = true
	else:
		playermoving = false
	
	velocity = velocity.lerp(direction * player_speed, 0.1)
	velocity *= 1.0 - (friction * delta)
	
	
	move_and_slide()

# Dash
	dash_cooldown -= delta
	if Input.is_action_pressed("dash") and dash_timer <= 0 and dash_cooldown <= 0 and is_player_moving:
		dash_timer = dash_duration
		player_speed *= dash_speed
		dash_cooldown = 5
		if $DashParticle:
			$DashParticle.emitting = true
		
		
		
	if dash_timer > 0:
		dash_timer -= delta
		if dash_timer <= 0:
			player_speed /= dash_speed
	
	
func player_hit():
	health -= 1
	print("player hit!", health)
	if health == 3:
		$HUD/HealthSprite2.play("Health 3")
	if health == 2:
		$HUD/HealthSprite2.play("Health 2")
	if health == 1:
		$HUD/HealthSprite2.play("Health 1")
	if health == 0:
		$HUD/HealthSprite2.play("Dead")

