extends Node3D

@export var icon : Texture2D
var user_name : String
var schedule : Dictionary = {}

var batch_generated : bool = false
var message_rate : float = -3.0

func _ready():
	add_to_group("users")
	var i = randi_range(0, ChatScript.user_icon_paths.size() - 1)
	icon = load(ChatScript.user_icon_paths[i])
	ChatScript.user_icon_paths.remove_at(i)
	i = randi_range(0, ChatScript.user_names.size() - 1)
	user_name = ChatScript.user_names[i]
	ChatScript.user_names.remove_at(i)
	%MessageSendTimer.wait_time = randf_range(3.5, 5)
	%MessageSendTimer.start()

func _on_message_send_timer_timeout():
	if schedule.is_empty():
		_generate_random_schedule()
	else:
		get_parent()._on_message_sent(icon, user_name, generate_condition())
	%MessageSendTimer.wait_time = randf_range(7.5, 10.0) + .5 * abs(message_rate)
	message_rate += 1.0

func generate_condition():
	var free_percent = calculate_free_percent()
	var type_to_add = randf()
	if type_to_add < 1.0 - free_percent:
		return generate_subtractive()
	else:
		return generate_additive()

func _generate_random_schedule():
	var type_to_generate = randi_range(0, 2)
	match type_to_generate:
		0:
			_generate_empty_schedule()
		1:
			_generate_unknown_schedule()
		2:
			_generate_full_schedule()
	get_parent().get_parent().users_ready += 1

func _generate_empty_schedule():
	for day in range(GameInfo.number_of_days):
		schedule[day] = "Free"
	get_parent()._on_message_sent(icon, user_name, "I'm usually free")
	
func _generate_unknown_schedule():
	for day in range(GameInfo.number_of_days):
		schedule[day] = "Unknown"
	get_parent()._on_message_sent(icon, user_name, "Hold on, let me check")

func _generate_full_schedule():
	for day in range(GameInfo.number_of_days):
		schedule[day] = "Busy"
	get_parent()._on_message_sent(icon, user_name, "I'm usually busy")

func generate_additive():
	
	var type_to_generate = randi_range(0, 2)
	
	if batch_generated:
		type_to_generate = 2
	
	match type_to_generate:
		0:
			batch_generated = true
			return generate_weekday_additive()
		1:
			batch_generated = true
			return generate_weekend_additive()
		2:
			# continue with single day generation
			pass

	var busy_day = randi_range(0,GameInfo.number_of_days - 1)
	if schedule[busy_day] == "Busy":
		return generate_nonsequitor()
	else:
		schedule[busy_day] = "Busy"
		return ChatScript.additive_messages[randi_range(0, ChatScript.additive_messages.size() - 1)].replace("%time%", NaturalizeSpeech.uncapital(busy_day))
	
func generate_subtractive():
	
	var type_to_generate = randi_range(0, 2)
	
	if batch_generated:
		type_to_generate = 2
	
	match type_to_generate:
		0:
			batch_generated = true
			return generate_weekday_subtractive()
		1:
			batch_generated = true
			return generate_weekend_subtractive()
		2:
			# continue with single day generation
			pass
	
	var free_day = randi_range(0,GameInfo.number_of_days - 1)
	if schedule[free_day] == "Free":
		return generate_nonsequitor()
	else: 
		schedule[free_day] = "Free"
		return ChatScript.subtractive_messages[randi_range(0, ChatScript.subtractive_messages.size() - 1)].replace("%time%", NaturalizeSpeech.uncapital(free_day))
	
	
func generate_nonsequitor():
	var nonsequitor_index = randi_range(0,ChatScript.nonsequitor_messages.size() - 1)
	return ChatScript.nonsequitor_messages[nonsequitor_index]
	
func check_date(date_to_check_index):
	if schedule[date_to_check_index] == "Busy":
		get_parent()._on_message_sent(icon, user_name, "I can't do " + NaturalizeSpeech.uncapital(date_to_check_index))
		return false
	elif schedule[date_to_check_index] == "Free":
		get_parent()._on_message_sent(icon, user_name, NaturalizeSpeech.capital(date_to_check_index) + " works for me")
		return true
	elif schedule[date_to_check_index] == "Unknown":
		if randi_range(0, 1) == 1:
			schedule[date_to_check_index] = "Free"
			get_parent()._on_message_sent(icon, user_name, "Turns out, " + NaturalizeSpeech.uncapital(date_to_check_index) + " works for me")
			return true
		else:
			schedule[date_to_check_index] = "Busy"
			get_parent()._on_message_sent(icon, user_name, "Sorry, " + NaturalizeSpeech.uncapital(date_to_check_index) + " doesn't work for me")
			return false
	
func calculate_free_percent():
	var total_days = 0.0
	var free_days = 0.0
	for day in schedule:
		if schedule[day] == "Free":
			free_days += 1.0
		total_days += 1.0
	return free_days / total_days
	
func generate_weekday_subtractive():
	# remove 0 or 6 from (days_offset - day) % 7
	for day in schedule:
		if (day + GameInfo.days_offset) % 7 != 0 and (day + GameInfo.days_offset) % 7 != 6:
			schedule[day] = "Free" 
	return ChatScript.weekday_subtractive_messages[randi_range(0, ChatScript.weekday_subtractive_messages.size() - 1)]
	
func generate_weekend_subtractive():
	# add 0 or 6 from (days_offset - day) % 7
	for day in schedule:
		if (day + GameInfo.days_offset) % 7 == 0 or (GameInfo.days_offset) % 7 == 6:
			schedule[day] = "Free"
	return ChatScript.weekend_subtractive_messages[randi_range(0, ChatScript.weekend_subtractive_messages.size() - 1)]
	
func generate_weekday_additive():
	# remove 0 or 6 from (days_offset - day) % 7
	for day in schedule:
		if (day + GameInfo.days_offset) % 7 != 0 and (day + GameInfo.days_offset) % 7 != 6:
			schedule[day] = "Busy" 
	return ChatScript.weekday_additive_messages[randi_range(0, ChatScript.weekday_additive_messages.size() - 1)]
	
func generate_weekend_additive():
	# add 0 or 6 from (days_offset - day) % 7
	for day in schedule:
		if (day + GameInfo.days_offset) % 7 == 0 or (GameInfo.days_offset) % 7 == 6:
			schedule[day] = "Busy"
	return ChatScript.weekend_additive_messages[randi_range(0, ChatScript.weekend_additive_messages.size() - 1)]
