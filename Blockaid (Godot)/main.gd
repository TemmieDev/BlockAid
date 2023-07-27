extends Node

onready var bullet_manager = $BulletManager
onready var player = $BulletManager

func_ready() -> void:
	player.connect
