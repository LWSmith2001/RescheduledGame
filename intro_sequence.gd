extends Node2D

@onready var chat_message_1 = %ChatMessage
@onready var chat_message_2 = %ChatMessage2
@onready var chat_message_3 = %ChatMessage3
@onready var animation_player = %AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	chat_message_1.populate_fields(chat_message_1.sender_icon, chat_message_1.sender_name, chat_message_1.message_text)
	chat_message_2.populate_fields(chat_message_2.sender_icon, chat_message_2.sender_name, chat_message_2.message_text)
	chat_message_3.populate_fields(chat_message_3.sender_icon, chat_message_3.sender_name, chat_message_3.message_text)
	animation_player.play("new_animation")



func _on_animation_player_animation_finished(anim_name):
	queue_free()
