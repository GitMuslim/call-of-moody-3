extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass

func _on_Next_pressed():
	get_tree().change_scene("res://Scenes/4.tscn")
	pass # Replace with function body.
