class_name Player extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var state_machine = $"State Machine"

@export var speed := 400
@export var gravity := 300
@export var jump_impulse := -280

func _ready() -> void:
	# init state machine, pass self as ref
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.physics_update(delta)

func _process(delta: float) -> void:
	state_machine.update(delta)
