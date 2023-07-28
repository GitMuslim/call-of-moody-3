extends Node2D

func _on_d_area_entered(area):
	if area.name == "m2d":
		$coin.play()
		remove_child($c)
		Globals.add_coins += 1
	pass
