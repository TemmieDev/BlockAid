extends CharacterBody2D

var health = int(100)

func handle_hit():
	health -= 100
	if health <= 0:
		queue_free()
sda
