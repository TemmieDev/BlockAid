extends CharacterBody2D

var health = int(100)

@onready var ai = $AI

func handle_hit():
	health -= 20
	print("enemy hit! ", health)
	if health <= 0:
		queue_free()
