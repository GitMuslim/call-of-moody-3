extends Node2D

var time = 0
var timer_on = false

func _process(delta):
	if(timer_on):
		$CanvasLayer/time.show()
		time += delta
	
	var mils = fmod(time,1)*1000
	var secs = fmod(time,60)
	var mins = fmod(time, 60*60) / 60
	var hr = fmod(fmod(time,3600 * 60) / 3600,24)
	var dy = fmod(time,12960000) / 86400
	
	var time_passed = "%02d : %02d : %02d : %02d : %03d" % [dy,hr,mins,secs,mils]
	get_node("CanvasLayer/time").text = str(time_passed)# + " : " + var2str(time)
	if OS.get_name() == "Android":
		if Globals.game_stage == 1:
			$CanvasLayer/f.show()
			$CanvasLayer/left.hide()
			$CanvasLayer/right.hide()
			$CanvasLayer/space.hide()
			$CanvasLayer/enter.hide()
			$CanvasLayer/z.hide()
			$CanvasLayer/up.hide()
			$CanvasLayer/down.hide()
		if Globals.game_stage == 2:
			$CanvasLayer/f.hide()
			$CanvasLayer/left.hide()
			$CanvasLayer/right.hide()
			$CanvasLayer/enter.hide()
			$CanvasLayer/z.hide()
			$CanvasLayer/up.hide()
			$CanvasLayer/down.hide()
		if Globals.game_stage == 3:
			$CanvasLayer/f.hide()
			$CanvasLayer/left.show()
			$CanvasLayer/right.show()
			$CanvasLayer/enter.show()
			$CanvasLayer/z.hide()
			$CanvasLayer/up.hide()
			$CanvasLayer/down.hide()
		if Globals.game_stage == 4:
			$CanvasLayer/f.hide()
			$CanvasLayer/left.hide()
			$CanvasLayer/right.hide()
			$CanvasLayer/enter.hide()
			$CanvasLayer/z.show()
			$CanvasLayer/up.show()
			$CanvasLayer/down.show()
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

func _on_up_pressed():
	Input.action_press("ui_up")
	pass

func _on_up_released():
	Input.action_release("ui_up")
	pass

func _on_down_pressed():
	Input.action_press("ui_down")
	pass

func _on_down_released():
	Input.action_release("ui_down")
	pass
