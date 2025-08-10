class_name move_component
extends Node

@export var velocity: Vector2
@export var actor: Node

func _process(delta: float) -> void:
	actor.translate(velocity * delta)
