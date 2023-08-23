extends CharacterBody2D


var health = int(100)
@export var movement_speed = 50
@onready var player = get_tree().get_first_node_in_group("player")
var dead = false

func handle_hit():
	health -= 20
	print("enemy hit! ", health)
	if health <= 0:
		dead = true
		queue_free()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed
	move_and_slide()

func _on_enemy_area_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
