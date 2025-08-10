extends Node2D

@onready var up: Marker2D = $up
@onready var down: Marker2D = $down
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.timeout.connect(fire_bullet)
	pass
	
func fire_bullet() -> void:
	spawner_component.spawn(up.global_position)
	spawner_component.spawn(down.global_position)
	
