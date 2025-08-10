class_name rocket_move
extends Node

@export var velocity: Vector2
@export var actor: Node2D

func _process(delta: float) -> void:
	var size = get_viewport().get_visible_rect().size
	var target_position = actor.position + (velocity * delta)
	if target_position.y >= -140 && target_position.y <= 140:
		actor.translate(velocity * delta)
