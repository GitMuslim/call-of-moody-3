extends Node2D

func _ready():
	$Control/coins.text = "Coins: "+str(Globals.all_coins)
	pass

func _on_1_pressed():
	pass

func _on_2_pressed():
	pass

func _on_3_pressed():
	pass

func _on_4_pressed():
	pass

func _on_5_pressed():
	pass

func _on_sus_pressed():
	get_tree().change_scene("res://Scenes/sus.tscn")
	pass
