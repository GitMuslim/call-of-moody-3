extends Node2D

var time = 0

func _ready():
	if OS.get_name() == "Android":
		$Control/tips.hide()
	randomize()
	var BG1 = rand_range(1, 255)
	randomize()
	var BG2 = rand_range(1, 255)
	randomize()
	var BG3 = rand_range(1, 255)
	VisualServer.set_default_clear_color(Color(BG1/255,BG2/255,BG3/255,1.0))
	pass

func _on_background_changer_timeout():
	randomize()
	var BG1 = rand_range(1, 255)
	randomize()
	var BG2 = rand_range(1, 255)
	randomize()
	var BG3 = rand_range(1, 255)
	VisualServer.set_default_clear_color(Color(BG1/255,BG2/255,BG3/255,1.0))
	pass


func _on_Play_pressed():
	if Globals.game_stage == 1:
		get_tree().change_scene("res://Scenes/SelectName.tscn")
	elif Globals.game_stage == 2:
		get_tree().change_scene("res://Scenes/LevelSelector.tscn")
	elif Globals.game_stage == 3:
		get_tree().change_scene("res://Scenes/com3_1.tscn")
	elif Globals.game_stage == 4:
		get_tree().change_scene("res://Scenes/com3_1.tscn")
	elif Globals.game_stage == 5:
		get_tree().change_scene("res://Scenes/credits.tscn")
	pass


func _on_reset_pressed():
	Globals.all_coins = 0
	Globals.add_coins = 0
	Globals.game_stage = 1
	Globals.portal_l = 1
	Globals.selection = 1
	Globals._save_stuff()
	pass
