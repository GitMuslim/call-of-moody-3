extends Node2D

var dont_add = true
var add_lim = 0

var summon_y = 0
var summon_y_c = 0
var sd_p = preload("res://Scenes/d6.tscn")
var sd_c = preload("res://Scenes/c6.tscn")

func _process(delta):
	$Camera2D/coins.text = "Coins: "+str(Globals.add_coins)
	if $wali.position.y < 88:
		get_tree().change_scene("res://Scenes/lost_com2_5.tscn")
	if $wali.position.y > 633:
		get_tree().change_scene("res://Scenes/lost_com2_5.tscn")
	if $wali.position.x > 15840:
		get_tree().change_scene("res://Scenes/com2_5.tscn")
	$Camera2D.position.x = $wali.position.x
	$ct_ost.position.x = $Camera2D.position.x
	VisualServer.set_default_clear_color(Color8(135, 206, 235,1.0))
	randomize()
	summon_y = rand_range(128, 576)
	randomize()
	summon_y_c = rand_range(128, 576)
	$wali.position.x += 5
	$wali.position.y += 5
	if dont_add == false:
		if add_lim > 49:
			dont_add = true
			add_lim = 0
		else:
			add_lim += 1
			$wali.position.y -= 8
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		dont_add = false
		add_lim = 0

func _on_summon_timeout():
	var sd = sd_p.instance()
	sd.position.x = $wali.position.x + 1000
	sd.position.y = summon_y
	add_child(sd)
	var sc = sd_c.instance()
	sc.position.x = $wali.position.x + 600
	sc.position.y = summon_y_c
	add_child(sc)
	pass
