extends Area2D

var speed = 300.0

func _ready():
	body_entered.connect(_on_body_entered)

func _process(delta):
	position.x -= speed * delta
	
	# Remove if off screen
	if position.x < -100:
		queue_free()

func set_speed(new_speed):
	speed = new_speed

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().call_group("game", "game_over")
