class_name bullet_move
extends Node

@export var velocity: Vector2
@export var actor: Node2D

func _process(delta: float) -> void:
	actor.translate(velocity * delta)
	if actor.position.x >= 700:
		actor.queue_free()
