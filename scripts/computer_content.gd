extends Control

@onready var v_box_container : VBoxContainer = %VBoxContainer
@onready var scroll_container : ScrollContainer = %ScrollContainer
@onready var scroll_bar = scroll_container.get_v_scroll_bar()

func _ready():
	scroll_bar.connect("changed", Callable(self, "_on_scrollbar_changed"))

func _add_message(icon, s_name, text):
	var new_message_scene = preload("res://scenes/chat_message.tscn")
	var new_message_node = new_message_scene.instantiate() as Control
	new_message_node.populate_fields(icon, s_name, text)
	
	v_box_container.add_child(new_message_node)


func _process(_delta):
	if Input.is_action_just_pressed("scroll_down"):
		scroll_container.scroll_vertical += 50
	if Input.is_action_just_pressed("scroll_up"):
		scroll_container.scroll_vertical -= 50
		
	if Input.is_action_pressed("scroll_down"):
		scroll_container.scroll_vertical += 15
	if Input.is_action_pressed("scroll_up"):
		scroll_container.scroll_vertical -= 15

func _on_scrollbar_changed():
	pass
