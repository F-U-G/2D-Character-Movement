extends State

func enter() -> void:
	player.animation.play("jump")
	player.velocity.y += player.jump_impulse

# use this for wall jumps later on
#func process_input(_event: InputEvent) -> State:
#	return null

func physics_update(_delta: float) -> State:
	player.velocity.y += player.gravity * _delta
	player.velocity.x = get_movement_direction() * player.speed
	player.move_and_slide()
	
	# flip animation based on direction
	if player.velocity.x < 0:
		player.animation.flip_h = true
	elif player.velocity.x > 0:
		player.animation.flip_h = false
	
	if player.is_on_floor():
		return state_machine.idle_state
	elif player.velocity.y >= 0: # when player starts to fall
		return state_machine.fall_state
	return null

func exit() -> void:
	pass
	# todo add a special animation that switches between the jump and fall animations
