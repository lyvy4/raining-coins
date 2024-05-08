extends CharacterBody2D

@onready var game = $".."
@onready var coin = $"../Coin"

var SPEED := 30000
var SCORE := 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	#initialize direction
	var direction = Vector2.ZERO
	
	# Handling horizontal movement
	if Input.is_key_pressed(KEY_LEFT):
		direction.x = -1 
	elif Input.is_key_pressed(KEY_RIGHT):
		direction.x = 1
		
	velocity = direction * SPEED * delta

	move_and_slide()
