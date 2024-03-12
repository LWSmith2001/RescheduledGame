extends Node3D

@export var days_offset : int
# Called when the node enters the scene tree for the first time.
func _ready():
	GameInfo.number_of_days = $Dates.get_child_count()
	GameInfo.days_offset = days_offset

func _on_date_picked(date_index):
	$DatePickedSFX.play()
	get_parent().speculative_date = date_index
	get_parent()._date_picked()

func _mouse_exited():
	get_parent().get_child(1).get_child(2).look_at(Vector3(0, 0, 0))
	
func _mouse_entered(date_position):
	$DateHoveredSFX.play()
	get_parent().get_child(1).get_child(2).look_at(date_position)
