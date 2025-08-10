class_name rocket_move
extends Node2D

@export var velocity: Vector2
@export var actor: Node2D
@export var dragging := false
@export var mouse_pos: Vector2

func _process(delta: float) -> void:
	var size = get_viewport().get_visible_rect().size
	var target_position = actor.position + (velocity * delta)
	if !dragging && target_position.y >= -140 && target_position.y <= 140:
		actor.translate(velocity * delta)
	if dragging && mouse_pos.y >= -140 && mouse_pos.y <= 140:
		actor.position = mouse_pos
