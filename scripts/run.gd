extends State

func enter() -> void:
	player.animation.play("run")

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return state_machine.jump_state
	return null

func physics_update(_delta: float) -> State:
	player.velocity.x = get_movement_direction() * player.speed
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()
	
	# flip animation based on direction
	if player.velocity.x < 0:
		player.animation.flip_h = true
	elif player.velocity.x > 0:
		player.animation.flip_h = false
	
	if player.velocity.length() < 0.1 and player.is_on_floor(): # player stops moving
		return state_machine.idle_state
	elif Input.is_action_just_pressed("jump") and player.is_on_floor():
		return state_machine.jump_state
	elif not player.is_on_floor():
		return state_machine.fall_state
	
	return null
