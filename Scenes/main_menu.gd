extends Node2D

func _on_background_changer_timeout():
	randomize()
	var BG1 = rand_range(1, 255)
	randomize()
	var BG2 = rand_range(1, 255)
	randomize()
	var BG3 = rand_range(1, 255)
	VisualServer.set_default_clear_color(Color(BG1/255,BG2/255,BG3/255,1.0))
	pass


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/SelectName.tscn")
	pass
