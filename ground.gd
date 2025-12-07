extends StaticBody2D

var scroll_speed = 300.0

func _process(delta):
	position.x -= scroll_speed * delta
	
	# Reset position for infinite scrolling
	if position.x < -960:
		position.x = 0

func set_speed(speed):
	scroll_speed = speed
