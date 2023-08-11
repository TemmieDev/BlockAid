extends Area2D
class_name Bullet

@export var speed = int(1000)

@onready var kill_timer = $KillTimer

var direction := Vector2.ZERO

func _ready():
	kill_timer.start()

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction.normalized() * speed
		global_position += velocity * delta

func set_direction(new_direction: Vector2) -> void:
	direction = new_direction
	rotation += direction.angle()
	


func _on_kill_timer_timeout():
	queue_free()





func _on_body_entered(body):
	if body.has_method("handle.hit"):
		body.handle_hit()
		queue_free()
