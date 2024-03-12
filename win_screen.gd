extends Control

func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
