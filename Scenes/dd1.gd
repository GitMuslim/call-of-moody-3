extends Node2D

func _on_d_area_entered(area):
	if area.name == "m2d":
		get_tree().change_scene("res://Scenes/nodie.tscn")
	pass
