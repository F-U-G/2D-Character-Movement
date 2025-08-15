class_name StateMachine extends Node

@export var initial_state: State
@export var idle_state: State
@export var run_state: State
@export var jump_state: State
@export var fall_state: State
var current_state: State

func init(player: Player) -> void:
	# set the parent to the player node so all states can access its vars
	for child in get_children():
		child.player = player
		child.state_machine = self
	change_state(initial_state)

# change state only happens if a state returns a state it wants to switch to
func change_state(new_state: State) -> void:
	# print("entering " + str(new_state))
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

# these three pass through to the states, if a state returns a new_state to 
# transition to then these functions will change to that state
func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func physics_update(delta: float) -> void:
	var new_state = current_state.physics_update(delta)
	if new_state:
		change_state(new_state)

func update(delta: float) -> void:
	var new_state = current_state.update(delta)
	if new_state:
		change_state(new_state)
