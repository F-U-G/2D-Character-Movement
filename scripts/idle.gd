extends State

func process_input(_event: InputEvent) -> State:
	if get_jump_input() and player.is_on_floor():
		return state_machine.jump_state
	elif get_movement_input() != 0:
		return state_machine.run_state
	
	return null

func physics_update(_delta: float) -> State:
	player.velocity.y += player.gravity * _delta
	player.velocity.x = movement
	player.move_and_slide()
	
	if !player.is_on_floor():
		return state_machine.fall_state
	return null
