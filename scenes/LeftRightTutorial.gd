extends Node2D

var a_key = false
var space_key = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("look_right") && !a_key && !space_key:
		$DKey.visible = false
		$AKey.visible = true
		a_key = true
		
	if Input.is_action_just_pressed("look_left") && a_key && !space_key:
		$AKey.visible = false
		space_key = true
		
	if Input.is_action_just_pressed("confirm") && space_key:
		$SpaceKey.visible = false
