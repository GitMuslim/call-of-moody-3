extends Node2D

var dont_add = true
var add_lim = 0

var summon_y = 0
var summon_y_c = 0
var sd_p = preload("res://Scenes/d1.tscn")
var sd_c = preload("res://Scenes/c1.tscn")

func _process(delta):
	$Camera2D/coins.text = "Coins: "+str(Globals.add_coins)
	if $amogus.position.y < 88:
		get_tree().change_scene("res://Scenes/lost_com2_sus.tscn")
	if $amogus.position.y > 633:
		get_tree().change_scene("res://Scenes/lost_com2_sus.tscn")
	if $amogus.position.x > 15840:
		get_tree().change_scene("res://Scenes/sus.tscn")
	$Camera2D.position.x = $amogus.position.x
	$ct_ost.position.x = $Camera2D.position.x
	VisualServer.set_default_clear_color(Color(0,0,0,1.0))
	randomize()
	summon_y = rand_range(128, 576)
	randomize()
	summon_y_c = rand_range(128, 576)
	$amogus.position.x += 5
	$amogus.position.y += 5
	if dont_add == false:
		if add_lim > 49:
			dont_add = true
			add_lim = 0
		else:
			add_lim += 1
			$amogus.position.y -= 8
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		dont_add = false
		add_lim = 0

func _on_summon_timeout():
	var sd = sd_p.instance()
	sd.position.x = $amogus.position.x + 1000
	sd.position.y = summon_y
	add_child(sd)
	var sc = sd_c.instance()
	sc.position.x = $amogus.position.x + 600
	sc.position.y = summon_y_c
	add_child(sc)
	pass
