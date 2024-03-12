extends Control
class_name chat_message

@export var sender_icon : Texture2D
@export var sender_name : String
@export var message_text : String

func populate_fields(icon, s_name, text):
	$MarginContainer/VBoxContainer/HBoxContainer/SenderIcon.texture = icon
	$MarginContainer/VBoxContainer/HBoxContainer/SenderName.text = s_name
	$MarginContainer/VBoxContainer/MessageText.text = text
