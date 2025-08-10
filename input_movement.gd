# input_movement.gd
class_name input_movement
extends Node

@export var rocket: rocket_move
@export var speed := 200

var dragging := false
var drag_offset := Vector2.ZERO

# Polygon points in global coordinates (order matters)
var click_area := [
	Vector2(53.11565, 187.2109),
	Vector2(54.42177, 134.3129),
	Vector2(107.102, 135.1837),
	Vector2(107.102, 187.864)
]

func _input(event: InputEvent) -> void:
	# --- Keyboard movement (if not dragging) ---
	var input_axis = Input.get_axis("ui_up", "ui_down")
	if input_axis != 0 and not dragging:
		rocket.velocity = Vector2(0, input_axis * speed)
	elif not dragging:
		rocket.velocity = Vector2.ZERO

	# --- Mouse press/release ---
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			print(Geometry2D.is_point_in_polygon(event.position, click_area))
			if Geometry2D.is_point_in_polygon(event.position, click_area):
				dragging = true
				drag_offset = rocket.position - event.position
				rocket.dragging = true
		else:
			rocket.dragging = false
			dragging = false

	# --- Mouse motion while dragging ---
	if event is InputEventMouseMotion and dragging:
		rocket.mouse_pos = Vector2(rocket.position.x, event.position.y + drag_offset.y)
