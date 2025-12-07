extends Node2D

@onready var player = $Player
@onready var ground = $Ground
@onready var obstacle_spawner = $ObstacleSpawner
@onready var score_label = $UI/ScoreLabel
@onready var game_over_panel = $UI/GameOverPanel
@onready var restart_button = $UI/GameOverPanel/RestartButton

var score = 0.0
var game_active = false
var base_speed = 300.0
var current_speed = 300.0

func _ready():
	add_to_group("game")
	game_over_panel.hide()
	restart_button.pressed.connect(_on_restart_pressed)
	start_game()

func _process(delta):
	if game_active:
		score += delta * 10
		score_label.text = "Score: " + str(int(score))
		
		# Gradually increase speed
		current_speed = base_speed + (score * 0.5)
		ground.set_speed(current_speed)
		obstacle_spawner.set_speed(current_speed)

func start_game():
	game_active = true
	score = 0
	current_speed = base_speed
	player.position = Vector2(200, 500)
	player.velocity = Vector2.ZERO
	obstacle_spawner.clear_obstacles()
	game_over_panel.hide()

func game_over():
	if game_active:
		game_active = false
		game_over_panel.show()

func _on_restart_pressed():
	start_game()
