extends Node

@onready var bullet_manager = $BulletManager
@onready var weapon = $Player/WeaponManager/Duck
@onready var gameover = $HUD/GameOverScreen
@onready var player = $Player
@onready var score = 0


func _ready():
	weapon.connect("player_fired_bullet", Callable(bullet_manager, "handle_bullet_spawned"))
	player.dead.connect(_on_player_killed)

func _on_player_killed():
	gameover.set_high_score(Save.highest_record)
	gameover.set_survived(floor(score))
	await get_tree().create_timer(1.5).timeout
	gameover.visible = true

func _physics_process(delta):
	if player:
		score += delta
