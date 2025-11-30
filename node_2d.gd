extends Node2D

@export var move_speed := 200.0

func _process(delta):
	position.x -= move_speed * delta

	# Remove when offscreen
	if position.x < -2000:
		queue_free()
