extends Node
# controller interface for the player, this can be swaped out for an AI controller in another project

enum Movement {
	LEFT = -1,
	NEUTRAL = 0,
	RIGHT = 1
}

func get_movement_direction() -> int:
	if Input.is_action_pressed("move_left"):
		return Movement.LEFT
	elif Input.is_action_pressed("move_right"):
		return Movement.RIGHT
	return Movement.NEUTRAL

func wants_jump() -> bool:
	return Input.is_action_just_pressed("jump")
