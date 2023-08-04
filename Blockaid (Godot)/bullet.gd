extends Area2D

@export var speed = int(100)

var direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction.normalized() * speed
		global_position += velocity * delta

func set_direction(new_direction: Vector2) -> void:
	direction = new_direction
