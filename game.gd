extends Node2D

@onready var coin = $Coin
@onready var player = $Player
var coin_scene = preload("res://coin.tscn")
var score := 0
@onready var label = $Label
@onready var game_over = $GameOver

const COIN_MIN_X := 15
const COIN_MAX_X := 1002
const COIN_Y := -10

# called to initiate a new coin
func spawn_coin():
	var new_coin = coin_scene.instantiate()
	new_coin.global_position = Vector2(randi_range(COIN_MIN_X, COIN_MAX_X), COIN_Y)
	new_coin.coin_collected.connect(_on_coin_coin_collected)
	new_coin.coin_missed.connect(_on_coin_coin_missed)
	add_child(new_coin)

func _on_coin_coin_collected():
	score += 1
	print(score)
	_update_score()
	spawn_coin.call_deferred()

func _on_coin_coin_missed():
	score = 0
	print(score)
	_update_score()
	game_over.play()
	spawn_coin.call_deferred()

func _update_score(): 
	label.text = "Score: "+ str(score)
