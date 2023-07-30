extends Node2D

var dont_add = true
var add_lim = 0

var stop = false

func _process(delta):
	$Camera2D/coins.text = "Coins: "+str(Globals.add_coins)
	if $m2d.position.y < 88:
		$m2d.position.y = 500
	if $m2d.position.y > 633:
		$m2d.position.y = 300
	VisualServer.set_default_clear_color(Color8(135, 206, 235,1.0))
	if stop == false:
		$Camera2D.position.x = $m2d.position.x
		$m2d.position.x += 5
		$m2d.position.y += 5
	if dont_add == false:
		if add_lim > 49:
			dont_add = true
			add_lim = 0
		else:
			add_lim += 1
			$m2d.position.y -= 8
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		dont_add = false
		add_lim = 0

func _on_Timer_timeout():
	stop = true
	$m2d.position.y = 300
	$m2d/m2d/saying/AnimationPlayer.play("saying")
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "saying":
		get_tree().change_scene("res://Scenes/com3_1.tscn")
	pass
