extends Node2D

var dont_add = true
var add_lim = 0

var summon_y = 0
var summon_y_c = 0
var sd_p = preload("res://Scenes/d3.tscn")
var sd_c = preload("res://Scenes/c3.tscn")

func _process(delta):
	$Camera2D/coins.text = "Coins: "+str(Globals.add_coins)
	if $aww.position.y < 88:
		get_tree().change_scene("res://Scenes/lost_com2_2.tscn")
	if $aww.position.y > 633:
		get_tree().change_scene("res://Scenes/lost_com2_2.tscn")
	if $aww.position.x > 15840:
		get_tree().change_scene("res://Scenes/com2_2.tscn")
	$Camera2D.position.x = $aww.position.x
	$ct_ost.position.x = $Camera2D.position.x
	VisualServer.set_default_clear_color(Color8(135, 206, 235,1.0))
	randomize()
	summon_y = rand_range(128, 576)
	randomize()
	summon_y_c = rand_range(128, 576)
	$aww.position.x += 5
	$aww.position.y += 5
	if dont_add == false:
		if add_lim > 49:
			dont_add = true
			add_lim = 0
		else:
			add_lim += 1
			$aww.position.y -= 8
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		dont_add = false
		add_lim = 0

func _on_summon_timeout():
	var sd = sd_p.instance()
	sd.position.x = $aww.position.x + 1000
	sd.position.y = summon_y
	add_child(sd)
	var sc = sd_c.instance()
	sc.position.x = $aww.position.x + 600
	sc.position.y = summon_y_c
	add_child(sc)
	pass
