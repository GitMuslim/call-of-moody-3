extends Node2D

var zone_enter = false
var enemy_attackable = false
var hp = 20
var countdown = 30

func _process(delta):
	if (countdown <= 0):
		get_tree().change_scene("res://Scenes/gameover.tscn")
	$Crosshair.position = get_viewport().get_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$BuuHealth.text = "MajinBuu Health: "+str(hp)
	if (hp <= 0):
		get_tree().change_scene("res://Scenes/v4.tscn")

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if (zone_enter == true):
				if (enemy_attackable == true):
					$saying.hide()
					hp -= 0.5723

func _on_BuuArea_mouse_entered():
	enemy_attackable = true
	pass

func _on_BuuArea_mouse_exited():
	enemy_attackable = false
	pass

func _on_change_pos_timeout():
	$saying.hide()
	randomize()
	var x = rand_range(100, 1200)
	randomize()
	var y = rand_range(100, 600)
	$BuuArea.position.x = x
	$BuuArea.position.y = y
	pass


func _on_start_timeout():
	zone_enter = true
	$change_pos.start()
	$countdown.start()
	pass


func _on_countdown_timeout():
	countdown -= 1
	$cd.text = "Countdown: "+str(countdown)
	pass
