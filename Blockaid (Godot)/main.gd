extends Node

@onready var bullet_manager = $BulletManager
@onready var player = $Player/WeaponManager/Duck


func _ready():
	player.connect("player_fired_bullet", Callable(bullet_manager, "handle_bullet_spawned"))


#22:08 https://www.youtube.com/watch?v=aY-B_5fYUos&list=PLpwc3ughKbZexDyPexHN2MXLliKAovkpl&index=8 
