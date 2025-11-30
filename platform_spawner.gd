extends Node2D

@export var platform_scene: PackedScene
@export var spawn_interval := 1.2
@export var spawn_x := 800  # offscreen to the right
var timer := 0.0

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_platform()

func spawn_platform():
	var platform = platform_scene.instantiate()
	platform.position = Vector2(spawn_x, randf_range(300, 380))
	get_tree().current_scene.add_child(platform)
