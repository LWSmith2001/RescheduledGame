extends Node3D

@export var player_icon : Texture2D
@export var player_name : String
var users_ready : int = 0
var speculative_date = null
var remaining_failed_attempts : int = 3
var stopped : bool = false
var fail_date : int
var looking_left : bool = true
@onready var fail_scene = preload("res://fail_screen.tscn")
@onready var win_scene = preload("res://win_screen.tscn")

func _ready():
	Engine.time_scale = 1.0
	stopped = false
	fail_date = randi_range(0,GameInfo.number_of_days - 1)
	$Computer._on_message_sent(player_icon, player_name, "I can't do " + NaturalizeSpeech.uncapital(fail_date) + ". We need to reschedule, what other times work?")
	ChatScript.refill_fields()

func _process(_delta):
	if Input.is_action_just_pressed("confirm") && !stopped && users_ready == 3 && speculative_date != null:
		_offer_date()
	if Input.is_action_just_pressed("look_right") && looking_left:
		%AnimationPlayer.play("look_left_to_right")
		$Player/SwivelRightSFX.play()
		looking_left = false
	if Input.is_action_just_pressed("look_left") && !looking_left:
		$Player/SwivelLeftSFX.play()
		%AnimationPlayer.play_backwards("look_left_to_right")
		looking_left = true  
		
func _offer_date():
	$Player/TypingSFX.play()
	$Computer._on_message_sent(player_icon, player_name, "Does " + NaturalizeSpeech.uncapital(int(speculative_date)) + " work for everyone?")
	if  _check_date_viability(int(speculative_date)) and $Computer._check_date_viability(int(speculative_date)):
		Engine.time_scale = 0.0
		var win_node = win_scene.instantiate()
		$CanvasLayer.add_child(win_node)
		stopped = true
	else:
		remaining_failed_attempts -= 1
		%HBoxContainer._on_value_changed(remaining_failed_attempts)
		if remaining_failed_attempts <= 0:
			var fail_node = fail_scene.instantiate()
			$CanvasLayer.add_child(fail_node)
			Engine.time_scale = 0.0
			stopped = true
	
func _check_date_viability(date):
	if date == fail_date:
		$Computer._on_message_sent(player_icon, player_name, "Nope, that still doesn't work for me, nevermind")
		return false
	return true

func _date_picked():
	$CanvasLayer/LeftRightTutorial/SpaceKey.visible = true
