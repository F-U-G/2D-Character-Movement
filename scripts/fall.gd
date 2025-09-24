extends State

# wall jump input handler goes here
#func process_input(_event: InputEvent) -> State:
#	return null

func physics_update(_delta: float) -> State:
	player.velocity.y += player.gravity * _delta
	movement = get_movement_input() * player.speed

	flip_animation()
	player.velocity.x = movement
	player.move_and_slide()
	
	if player.is_on_floor():
		if movement == 0:
			return state_machine.idle_state
		else:
			return state_machine.run_state
	return null
