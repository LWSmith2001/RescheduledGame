extends Node3D

@onready var computer_content = $SubViewport/ComputerContent

func _on_message_sent(icon, s_name, text):
	$NotificationSFX.play()
	computer_content._add_message(icon, s_name, text)

func _check_date_viability(speculative_date_index):
	var date_viable : bool = true
	for user in get_tree().get_nodes_in_group("users"):
		if !user.check_date(speculative_date_index):
			date_viable = false
	return date_viable

