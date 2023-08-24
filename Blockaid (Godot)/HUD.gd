extends CanvasLayer

var dashcool = 0
var score = 0
var health = 4

func _physics_process(delta):
	if Input.is_action_pressed("dash") and dashcool <= 0 and Player.playermoving:
		dashcool = 5
		$DashSprite.play("dash_pressed")
	if dashcool > 0:
		dashcool -= delta
		$DashCooldown.text = str(floor(dashcool))
	else:
		$DashCooldown.text = ''
		$DashSprite.play('dash')
	if health > 0:
		score += delta
		$Score/ScoreNum.text = str(floor(score))
	if score > Save.highest_record:
		Save.highest_record = score
	$HighScore/HighScoreNum.text = str(floor(Save.highest_record))
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$PauseMenu.pause()
	

func _on_player_hit():
	health -= 1
	if health == 3:
		$HealthSprite.play("Health 3")
	if health == 2:
		$HealthSprite.play("Health 2")
	if health == 1:
		$HealthSprite.play("Health 1")
	if health == 0:
		$HealthSprite.play("Dead")
	$HitOverlay.visible = true
	await get_tree().create_timer(1.5).timeout
	$HitOverlay.visible = false


func _on_player_dead():
	Save.save_score()
