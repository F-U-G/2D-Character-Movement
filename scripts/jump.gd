extends State

var held_jump_timer := 0.3
var jump_timer := 0.0

func enter() -> void:
	super()
	player.velocity.y += player.jump_impulse
	jump_timer = held_jump_timer

# use this for wall jumps later on
#func process_input(_event: InputEvent) -> State:
#	return null

func physics_update(_delta: float) -> State:
	jump_timer -= _delta

	if jump_timer > 0.0 and move_controller.jump_held():
		player.velocity.y += player.extended_jump_impulse

	if move_controller.jump_ended(): # end extended jump if jump is released
		jump_timer = 0.0

	player.velocity.y += player.gravity * _delta
	movement = get_movement_input() * player.speed

	flip_animation()
	player.velocity.x = movement
	player.move_and_slide()
	
	
	if player.is_on_floor():
		return state_machine.idle_state
	elif player.velocity.y >= 0: # when player starts to fall
		return state_machine.fall_state
	return null

func exit() -> void:
	pass
	# todo add a special animation that switches between the jump and fall animations
