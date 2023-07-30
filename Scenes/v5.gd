extends Node2D

func _ready():
	Globals.game_stage = 2
	Globals._save_stuff()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass

func _on_Next_pressed():
	Globals.game_stage = 2
	Globals._save_stuff()
	get_tree().change_scene("res://Scenes/LevelSelector.tscn")
	pass
