extends Control

func _ready():
	Engine.time_scale = 1.0
	for color_rect in $CanvasLayer/GridContainer.get_children():
		await get_tree().create_timer(randf_range(.5, 1.0)).timeout
		color_rect.get_child(0).color.a = randi_range(0, 1)

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
