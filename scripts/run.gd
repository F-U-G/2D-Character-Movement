extends State

func process_input(_event: InputEvent) -> State:
	if get_jump_input() and player.is_on_floor():
		return state_machine.jump_state
	return null

func physics_update(_delta: float) -> State:
	player.velocity.y += player.gravity * _delta
	movement = get_movement_input() * player.speed
	velocity_weight = _delta * (player.acceleration if get_movement_input() else player.friction)

	flip_animation()
	player.velocity.x = lerp(player.velocity.x, movement, velocity_weight)
	player.move_and_slide()

	if movement == 0:
		return state_machine.idle_state
	
	
	if !player.is_on_floor():
		return state_machine.fall_state
	
	return null
