extends Node3D
class_name Date
@onready var label_3d = %Label3D
@export var date : String = "0"
var entered : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	label_3d.text = date

func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			get_parent().get_parent()._on_date_picked(str(int(date) - 1))
	if event is InputEventMouseMotion && !entered:
		entered = true
		label_3d.shaded = false
		get_parent().get_parent()._mouse_entered(global_position)


func _on_area_3d_mouse_exited():
	entered = false
	label_3d.shaded = true
	get_parent().get_parent()._mouse_exited()
