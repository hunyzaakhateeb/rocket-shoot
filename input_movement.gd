class_name input_movement
extends Node

@export var rocket: rocket_move
#@export var bullet_move: move_component

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_axis("ui_up","ui_down")
	rocket.velocity = Vector2(0,input_axis * 200)
	#bullet_move.velocity = Vector2(1, input_axis * 120)
