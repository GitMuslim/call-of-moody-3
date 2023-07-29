extends Node2D

func _ready():
	Globals.all_coins += Globals.add_coins
	Globals.add_coins = 0
	print(Globals.all_coins)
	pass

func _on_sus_pressed():
	get_tree().change_scene("res://Scenes/LevelSelector.tscn")
	pass
