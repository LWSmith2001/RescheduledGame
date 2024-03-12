extends Node

var music_player = AudioStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(music_player)
	music_player.stream = preload("res://assets/music/bgmusic.ogg")
	music_player.play()
