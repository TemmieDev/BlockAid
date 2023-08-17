extends Node2D


signal state_changed(new_state)

enum State {
	PATROL,
	ENGAGE,
}

@onready var player_detection_zone = $PlayerDectectionZone

var current_state = int(State.PATROL set_state)

func set_state(new_state: int):
	if new_state == current_state:
		return
	
	current_state = new_state 
	emmit_signal("state_changed", current_state)


func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	pass

