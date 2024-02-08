extends Node2D

signal player_fired_bullet(bullet, position, direction)

@export var bullet = preload("res://bullet.tscn")
@onready var end_of_weapon = $EndofWeapon
@onready var gunDirection = $GunDirection
@onready var attack_cooldown = $AttackCooldown
@onready var shootsfx = $AudioStreamPlayer2D

func _physics_process(delta):
	if Input.is_action_pressed("shoot"):
		shoot()

func shoot():
	if attack_cooldown.is_stopped():
		var bullet_instance = bullet.instantiate()
		var direction = (gunDirection.global_position - end_of_weapon.global_position).normalized()
		emit_signal('player_fired_bullet', bullet_instance, end_of_weapon.global_position, direction)
		attack_cooldown.start()
		shootsfx.play()
