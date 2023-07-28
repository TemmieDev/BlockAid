extends CanvasLayer

var dashcool = 0

func _physics_process(delta):
	if Input.is_action_pressed("dash") and dashcool <= 0 and Player.playermoving:
		dashcool = 5
		$AnimatedSprite2D.play("dash_pressed")
	if dashcool > 0:
		dashcool -= delta
		$DashCooldown.text = str(floor(dashcool))
	else:
		$DashCooldown.text = ''
		$AnimatedSprite2D.play('dash')


