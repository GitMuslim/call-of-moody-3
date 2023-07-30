extends Node2D

func _ready():
	if Globals.portal_l < 4:
		Globals.game_stage = 3
	elif Globals.portal_l > 3:
		Globals.game_stage = 4
	Globals._save_stuff()
	pass

func _process(delta):
	if Globals.portal_l < 4:
		if Input.is_action_just_pressed("ui_right"):
			Globals.selection += 1
		if Input.is_action_just_pressed("ui_left"):
			Globals.selection -= 1
		if Globals.selection > 3:
			Globals.selection = 1
		elif Globals.selection < 1:
			Globals.selection = 3
		if Globals.selection == 1:
			$Control/M2d.position.x = 220
		if Globals.selection == 2:
			$Control/M2d.position.x = 610
		if Globals.selection == 3:
			$Control/M2d.position.x = 1000
		if Input.is_action_just_pressed("ui_accept"):
			if Globals.selection == 1:
				get_tree().change_scene("res://Scenes/com3_lv1.tscn")
			elif Globals.selection == 2:
				if Globals.portal_l > 1:
					get_tree().change_scene("res://Scenes/com3_lv2.tscn")
			elif Globals.selection == 3:
				if Globals.portal_l > 2:
					get_tree().change_scene("res://Scenes/com3_lv3.tscn")
		$Control/boss.hide()
	if Globals.portal_l > 1:
		$GreenFlag1.show()
		$Control/P2/status.hide()
	if Globals.portal_l > 2:
		$GreenFlag2.show()
		$Control/P3/status.hide()
	if Globals.portal_l > 3:
		$GreenFlag1.hide()
		$GreenFlag2.hide()
		$GreenFlag3.hide()
		$Control/boss.show()
		$Control/P1.hide()
		$Control/P2.hide()
		$Control/P3.hide()
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://Scenes/boss.tscn")
	pass
