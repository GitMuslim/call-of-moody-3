extends Node2D

func _process(delta):
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
	if Globals.portal_l > 1:
		$GreenFlag1.show()
		$Control/P2/status.hide()
	if Globals.portal_l > 2:
		$GreenFlag2.show()
		$Control/P3/status.hide()
	if Globals.portal_l > 3:
		$GreenFlag3.show()
	if Input.is_action_just_pressed("ui_accept"):
		if Globals.selection == 1:
			get_tree().change_scene("res://Scenes/com3_lv1.tscn")
		elif Globals.selection == 2:
			if Globals.portal_l > 1:
				get_tree().change_scene("res://Scenes/com3_lv2.tscn")
		elif Globals.selection == 3:
			if Globals.portal_l > 2:
				get_tree().change_scene("res://Scenes/com3_lv3.tscn")
	pass
