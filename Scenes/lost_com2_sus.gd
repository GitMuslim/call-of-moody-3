extends Node2D

func _ready():
	Globals.all_coins += Globals.add_coins
	Globals.add_coins = 0
	Globals._save_stuff()
	pass

func _on_sus_pressed():
	Globals._save_stuff()
	get_tree().change_scene("res://Scenes/LevelSelector.tscn")
	pass
