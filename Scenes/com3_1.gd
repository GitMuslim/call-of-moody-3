extends Node2D

var selection = 1

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		selection += 1
	if Input.is_action_just_pressed("ui_left"):
		selection -= 1
	if selection > 3:
		selection = 1
	elif selection < 1:
		selection = 3
	if selection == 1:
		$Control/M2d.position.x = 220
	if selection == 2:
		$Control/M2d.position.x = 610
	if selection == 3:
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
		if selection == 1:
			get_tree().change_scene("res://Scenes/com3_lv1.tscn")
		elif selection == 2:
			if Globals.portal_l > 1:
				print("sus2")
		elif selection == 3:
			if Globals.portal_l > 2:
				print("sus3")
	pass
