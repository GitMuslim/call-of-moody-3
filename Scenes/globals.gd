extends Node

var all_coins = 350
var add_coins = 0
var cur_stage = 0

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
