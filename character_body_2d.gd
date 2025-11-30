extends CharacterBody2D

@export var speed := 200.0
@export var jump_force := 400.0
@export var gravity := 900.0

func _physics_process(delta):
	# Apply gravity
	velocity.y += gravity * delta

	# Constant forward speed
	velocity.x = speed

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	move_and_slide()
