extends Node2D

func _on_d_area_entered(area):
	if area.name == "amogus":
		get_tree().change_scene("res://Scenes/lost_com2_sus.tscn")
	pass
