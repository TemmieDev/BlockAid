extends CharacterBody2D
class_name Weapon


var health = int(100)

@onready var ai = $AI
@onready var weapon = $Weapon

func _ready() -> void:
	ai.initalize{self, weapon}

func handle_hit():
	health -= 20
	print("enemy hit! ", health)
	if health <= 0:
		queue_free()
