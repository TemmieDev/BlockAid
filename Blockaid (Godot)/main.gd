extends Node

@onready var bullet_manager = $BulletManager
@onready var player = $BulletManager

func _ready() -> void:
	player.connect
