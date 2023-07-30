extends Node2D

func _process(delta):
	if $Control/NameEnter.text.length() == 2:
		$Control/Title.text = "Name's been chosen"
		$Control/NameEnter.editable = false
		if (OS.has_environment("USERNAME")):
			$Control/NameEnter.text = OS.get_environment("USERNAME")
		else:
			$Control/NameEnter.text = "NO_NAME"
		$Control/yes.disabled = false
		pass
	

func _on_Button_pressed():
	TouchControls.timer_on = true
	get_tree().change_scene("res://Scenes/1.tscn")
	pass
