extends CharacterBody2D

signal dead

var health = int(100)
@export var movement_speed = 50
@onready var player = get_tree().get_first_node_in_group("player")
@onready var deathsfx = $AudioStreamPlayer2D
@onready var enemycol = $EnemyCollision
@onready var enemysprite = $Sprite2D
@onready var enemyarea = $EnemyArea
@onready var hitpart = $HitParticle
@onready var dietime = 0


func handle_hit():
	health -= 20
	print("enemy hit! ", health)
	if health == 0:
		remove_child(enemycol)
		remove_child(enemysprite)
		remove_child(enemyarea)
		deathsfx.play()
		await deathsfx.finished
		emit_signal("dead")
		queue_free()

		
func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed
	move_and_slide()

func _on_enemy_area_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
