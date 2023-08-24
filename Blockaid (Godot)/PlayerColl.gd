extends CollisionShape2D

@onready var immo = 0

func _physics_process(delta):
	if immo == 1.5:
		self.disabled = true
	if immo <= 0:
		self.disabled = false
	immo -= delta

func _on_player_hit():
	immo = 1.5

