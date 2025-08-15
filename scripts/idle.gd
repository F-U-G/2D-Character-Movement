extends State

func enter() -> void:
	player.animation.play("idle")

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		return state_machine.jump_state
	elif Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return state_machine.run_state
	
	return null

func physics_update(_delta: float) -> State:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		return state_machine.fall_state
	return null
