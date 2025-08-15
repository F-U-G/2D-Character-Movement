extends State

func enter() -> void:
	parent.animation.play("idle")
	print(parent.speed)
