class_name State extends Node

# vars to access the data in the higher nodes
var player: Player
var state_machine: StateMachine

func enter() -> void:
	pass

func exit() -> void:
	pass

# a func that all states can use in order to move left or right
# this prevents the player from stopping if they are holding one key then holding the other
func get_movement_direction() -> int:
	if Input.is_action_pressed("move_left"):
		return -1
	elif Input.is_action_pressed("move_right"):
		return 1
	return 0

# return a new state in order to change to another state
func process_input(_event: InputEvent) -> State:
	return null

func update(_delta: float) -> State:
	return null

func physics_update(_delta: float) -> State:
	return null
