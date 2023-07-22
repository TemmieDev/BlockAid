extends CanvasLayer

var dashcool = 0

func _process(delta):
	if Input.is_action_pressed("dash") and dashcool <= 0 and Player.playermoving:
		dashcool = 5
	if dashcool > 0:
		dashcool -= delta
		$DashCooldown.text = str(floor(dashcool))
	else:
		$DashCooldown.text = ''


