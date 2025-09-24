class_name State extends Node

@export var animation_name: String

var player: CharacterBody2D
var state_machine: StateMachine
var animation: AnimatedSprite2D
var move_controller

var velocity_weight : float
var movement : float


func flip_animation() -> void: # flips animation based on horizontal movement
	if player.velocity.x < 0:
		animation.flip_h = true
	if player.velocity.x > 0:
		animation.flip_h = false


# these two functions can be overrided to lock inputs into a specific state(like a dash state)
func get_movement_input() -> int:
	return move_controller.get_movement_direction()

func get_jump_input() -> bool:
	return move_controller.wants_jump()


func enter() -> void:
	animation.play(animation_name)

func exit() -> void:
	pass

# return a new state in order to change to another state
func process_input(_event: InputEvent) -> State:
	return null

func update(_delta: float) -> State:
	return null

func physics_update(_delta: float) -> State:
	return null
