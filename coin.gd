extends Area2D

signal coin_collected()
signal coin_missed()

# Called when the node enters the scene tree for the first time.
var fall_speed := 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Initiate coin movement
	position.y += fall_speed * delta

func _on_area_entered(area):
	if not area.is_in_group("floor"):
		return
	coin_missed.emit()
	queue_free()

func _on_body_entered(body):
	if not body.is_in_group("player"):
		return
	coin_collected.emit()
	queue_free()
