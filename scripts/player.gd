class_name Player extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var state_machine = $"State Machine"
@onready var move_controller = $"Movement Controller"

@export var speed := 370.0
@export var acceleration := 5.0
@export var friction := 10.0
@export var gravity := 500.0
@export var jump_impulse := -160.0
@export var extended_jump_impulse := -10.0

func _ready() -> void:
	# init state machine, pass self as ref
	state_machine.init(self, animation, move_controller)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)

func _process(delta: float) -> void:
	state_machine.update(delta)
