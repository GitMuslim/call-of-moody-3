extends Node2D

var text = 0
var text_array = ["I won't hurt you", "I know what you thinking", "Why is Jerry in Freddy's Pizzeria?", "Tom is just scared to come here", "And there's no cat animatronic over here", "Don't worry I'll just chat here.", "But don't think you won't get challenged", "I hid a bomb here lol", "Press a specific button to defuse it"]
var bomb_def = false
var cd = 20

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Boom.hide()
	pass

func _on_change_text_timeout():
	_change_text()
	text += 1
	if (text > 9):
		if (bomb_def == false):
			$cd.show()
			$jerry_pos.play("jerry_pos")
	if (text > 8):
		$Boom.show()
	if (text == 10):
		$saying.text = ""
		$countdown.start()
		$change_text.stop()
	pass

func _change_text():
	if not (text > 8):
		$saying.text = text_array[text]

func _process(delta):
	if (text > 8):
		if (bomb_def == false):
			if Input.is_action_just_pressed("bomb"):
				$countdown.stop()
				bomb_def = true
				$jerry_pos.stop()
				$saying.text = "Good job you stopped the bomb, But its now glued to you so next level will be timed"
				$next_level.start()


func _on_next_level_timeout():
	get_tree().change_scene("res://Scenes/v3.tscn")
	pass


func _on_countdown_timeout():
	if (bomb_def == false):
		cd -= 1
		$cd.text = "Countdown: "+str(cd)
	if (cd <= 0):
		get_tree().change_scene("res://Scenes/gameover.tscn")
	pass # Replace with function body.
