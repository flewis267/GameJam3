extends Node2D

@export var obstacle_scene: PackedScene
var spawn_timer = 0.0
var spawn_interval = 2.0
var min_interval = 1.0
var scroll_speed = 300.0

func _ready():
	randomize()

func _process(delta):
	spawn_timer += delta
	
	if spawn_timer >= spawn_interval:
		spawn_obstacle()
		spawn_timer = 0.0
		# Gradually decrease spawn interval
		spawn_interval = max(min_interval, spawn_interval - 0.01)

func spawn_obstacle():
	if obstacle_scene:
		var obstacle = obstacle_scene.instantiate()
		obstacle.position = Vector2(1200, 580) # 1200, 520
		obstacle.set_speed(scroll_speed)
		add_child(obstacle)

func set_speed(speed):
	scroll_speed = speed
	for child in get_children():
		if child.has_method("set_speed"):
			child.set_speed(speed)

func clear_obstacles():
	for child in get_children():
		child.queue_free()
