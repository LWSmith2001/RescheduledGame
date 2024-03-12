extends HBoxContainer

@onready var icon_children : Array[TextureRect]

func _ready():
	var children = get_children()
	for child in children:
		icon_children.append(child as TextureRect)
		
func _on_value_changed(remaining_tries):
	for child in get_children():
		child.visible = false
	for child_index in range(0, remaining_tries):
		icon_children[child_index].visible = true
