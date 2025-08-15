extends State

func enter() -> void:
	player.animation.play("fall")

# wall jump input handler goes here
#func process_input(_event: InputEvent) -> State:
#	return null

func physics_update(_delta: float) -> State:
	player.velocity.x = get_movement_direction() * player.speed
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()
	
	# flip animation based on direction
	if player.velocity.x < 0:
		player.animation.flip_h = true
	elif player.velocity.x > 0:
		player.animation.flip_h = false
	
	if player.is_on_floor():
		if is_equal_approx(Input.get_axis("move_left", "move_right"), 0.0):
			return state_machine.idle_state
		else:
			return state_machine.run_state
	return null
