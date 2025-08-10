extends Node2D

@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D as VisibleOnScreenNotifier2D
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var move_component_obj: move_component = $move_component as move_component
@onready var shake_component: ShakeComponent = $ShakeComponent as ShakeComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent as HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent as HitboxComponent

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		#queue_free()
		scale_component.tween_scale()
		flash_component.flash()
		shake_component.tween_shake()
	)
	stats_component.no_health.connect(queue_free)
	#hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		#queue_free()
	#)
	
