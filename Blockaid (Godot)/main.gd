extends Node

@onready var bullet_manager = $BulletManager
@onready var player = $Player/WeaponManager/Duck

func _ready():
	player.connect("player_fired_bullet", Callable(bullet_manager, "handle_bullet_spawned"))
