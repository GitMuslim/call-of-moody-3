extends Node2D

var s1 = false
var s2 = false
var s3 = false
var s4 = false
var s5 = false

func _process(delta):
	$Control/coins.text = "Coins: "+str(Globals.all_coins)
	if Globals.all_coins >= 310:
		get_node("Control/1").hide()
		get_node("Control/2").hide()
		get_node("Control/3").hide()
		get_node("Control/4").hide()
		get_node("Control/5").hide()
		get_node("Control/sus").hide()
		get_node("Control/m2d").show()
		get_node("Control/coins2").hide()
	else:
		get_node("Control/m2d").hide()
	if Globals.all_coins >= 75:
		s1 = true
	if Globals.all_coins >= 125:
		s2 = true
	if Globals.all_coins >= 175:
		s3 = true
	if Globals.all_coins >= 225:
		s4 = true
	if Globals.all_coins >= 275:
		s5 = true
	if s1:
		get_node("Control/1/s").text = "Unlocked"
	if s2:
		get_node("Control/2/s").text = "Unlocked"
	if s3:
		get_node("Control/3/s").text = "Unlocked"
	if s4:
		get_node("Control/4/s").text = "Unlocked"
	if s5:
		get_node("Control/5/s").text = "Unlocked"
	pass

func _on_1_pressed():
	if s1:
		Globals.add_coins = 0
		get_tree().change_scene("res://Scenes/com2_1_b.tscn")
	pass

func _on_2_pressed():
	if s2:
		Globals.add_coins = 0
		get_tree().change_scene("res://Scenes/com2_2_b.tscn")
	pass

func _on_3_pressed():
	if s3:
		Globals.add_coins = 0
		get_tree().change_scene("res://Scenes/com2_3_b.tscn")
	pass

func _on_4_pressed():
	if s4:
		Globals.add_coins = 0
		get_tree().change_scene("res://Scenes/com2_4_b.tscn")
	pass

func _on_5_pressed():
	if s5:
		Globals.add_coins = 0
		get_tree().change_scene("res://Scenes/com2_5_b.tscn")
	pass

func _on_sus_pressed():
	Globals.add_coins = 0
	get_tree().change_scene("res://Scenes/sus.tscn")
	pass


func _on_m2d_pressed():
	get_tree().change_scene("res://Scenes/com2_m2d_b.tscn")
	pass
