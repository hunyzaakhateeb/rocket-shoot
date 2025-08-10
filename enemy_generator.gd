extends Node2D

#@export var scene: PackedScene
const scene = preload("res://alien_enemy.tscn")

var margin = 10
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_height")

@onready var spawner_component: = $SpawnerComponent as SpawnerComponent
@onready var spawn_timer: Timer = $timer_1
@onready var level_timer: Timer = $level_timer

func _ready() -> void:
	spawn_timer.timeout.connect(handle_spawn.bind(scene, spawn_timer))
	level_timer.timeout.connect(decrease_spawn_timer.bind(spawn_timer))
	
func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawner_component.scene = enemy_scene
	spawner_component.spawn(Vector2(500, randf_range(screen_width - margin, margin)))
	timer.start()
	
func decrease_spawn_timer(target_timer: Timer) -> void:
	if target_timer.wait_time > 0.2:
		target_timer.wait_time = target_timer.wait_time - 0.2
	else:
		level_timer.stop()
