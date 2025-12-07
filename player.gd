extends CharacterBody2D

const JUMP_VELOCITY = -600.0
const GRAVITY = 1800.0

var is_jumping = false

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	
	if is_on_floor():
		is_jumping = false
	
	move_and_slide()
