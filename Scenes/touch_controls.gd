extends Node2D

func _process(delta):
	if OS.get_name() == "Android":
		if Globals.game_stage == 1:
			$CanvasLayer/f.show()
		if Globals.game_stage > 1:
			$CanvasLayer/left.show()
			$CanvasLayer/right.show()
			$CanvasLayer/space.show()
			$CanvasLayer/enter.show()
	pass

func _on_left_pressed():
	Input.action_press("ui_left")
	pass

func _on_left_released():
	Input.action_release("ui_left")
	pass

func _on_right_pressed():
	Input.action_press("ui_right")
	pass

func _on_right_released():
	Input.action_release("ui_right")
	pass

func _on_space_pressed():
	Input.action_press("ui_select")
	pass

func _on_space_released():
	Input.action_release("ui_select")
	pass

func _on_enter_pressed():
	Input.action_press("ui_accept")
	pass

func _on_enter_released():
	Input.action_release("ui_accept")
	pass

func _on_f_released():
	Input.action_press("bomb")
	pass

func _on_f_pressed():
	Input.action_release("bomb")
	pass
