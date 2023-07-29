extends Node2D

func _on_d_area_entered(area):
	if area.name == "wali":
		get_tree().change_scene("res://Scenes/lost_com2_5.tscn")
	pass
