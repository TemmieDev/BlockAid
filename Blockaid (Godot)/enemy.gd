extends CharacterBody2D

signal dead

var health = int(100)
@export var movement_speed = 50
@onready var player = get_tree().get_first_node_in_group("player")
@onready var deathsfx = $AudioStreamPlayer2D
@onready var enemycol = $EnemyCollision
@onready var enemysprite = $AnimatedSprite2D
@onready var enemyarea = $EnemyArea
@onready var deathpart = $DeathParticle
@onready var dietime = 0


func handle_hit():
	health -= 20
	print("enemy hit! ", health)
	if health == 0:
		remove_child(enemycol)
		enemysprite.hide()
		remove_child(enemyarea)
		deathpart.emitting = true
		deathsfx.play()
		await get_tree().create_timer(1).timeout
		emit_signal("dead")
		queue_free()
	$AnimatedSprite2D.play("Hit")
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.play("default")

		
func _physics_process(_delta):
	if health > 0:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction*movement_speed
		move_and_slide()

func _on_enemy_area_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
