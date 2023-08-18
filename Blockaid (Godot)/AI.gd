extends Node2D

signal state_changed(new_state)

enum State {
PATROL,
ENGAGE
}

@onready var player_detection_zone = $PlayerDetectionZone
var current_state = State.PATROL
var actor = null
var player: Player = null
var weapon: Weapon = null

func _process(delta):
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null and weapon!= null:
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
				weapon.shoot()
			else:
				print("In the engage state but no weapon/player")
		_:
			print("Error: found a state for our enemy that should not exist")

func initalize(actor, weapon: Weapon):
	self.actor = actor
	self.weapon = weapon

func set_state(new_state: State):
	if new_state == current_state:
		return
		current_state = new_state
	emit_signal("state_changed", current_state)


func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		player = body



#continue at 16:07
