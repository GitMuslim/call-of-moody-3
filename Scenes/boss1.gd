extends Node2D

var dir = 0
var void_bullet_p = preload("res://Scenes/void_bullet.tscn")
var kick_bullet_p = preload("res://Scenes/kick_bullet.tscn")
var ban_bullet_p = preload("res://Scenes/ban_bullet.tscn")

var bull_num = 0
var cur_bull = 0
var can_shoot = true
var void_hp = 50
var hp = 3

func _ready():
	VisualServer.set_default_clear_color(Color8(92, 64, 51,1.0))
	pass

func _process(delta):
	if void_hp < 1:
		$ColorRect/fade.play("fade")
	$void_hp.text = "Void HP: "+str(void_hp)
	$m2d_hp.text = "M2D HP: "+str(hp)
	cur_bull = 0
	if bull_num > 0:
		cur_bull = bull_num
		for n in bull_num:
			if n > 0:
				get_node("void_bullet"+str(n)).position.x -= 5
	if dir == 0:
		get_node("void").position.y += 2.5
	elif dir == 1:
		get_node("void").position.y -= 2.5
	if get_node("void").position.y > 642:
		dir = 1
	if get_node("void").position.y < 64:
		dir = 0
	if Input.is_action_pressed("ui_up"):
		if $m2d.position.y > 64:
			$m2d.position.y -= 5
	if Input.is_action_pressed("ui_down"):
		if $m2d.position.y < 642:
			$m2d.position.y += 5
	if Input.is_action_just_pressed("ui_accept"):
		if can_shoot:
			if void_hp > 1:
				var kick_bullet = kick_bullet_p.instance()
				kick_bullet.position.x = get_node("m2d").position.x
				kick_bullet.position.y = get_node("m2d").position.y
				add_child(kick_bullet)
				can_shoot = false
				$cooldown.start()
			elif void_hp == 1:
				var ban_bullet = ban_bullet_p.instance()
				ban_bullet.position.x = get_node("m2d").position.x
				ban_bullet.position.y = get_node("m2d").position.y
				add_child(ban_bullet)
				can_shoot = false
	pass

func _on_bullet_timer_timeout():
	var void_bullet = void_bullet_p.instance()
	void_bullet.position.x = get_node("void").position.x
	void_bullet.position.y = get_node("void").position.y
	void_bullet.name = "void_bullet"+str(bull_num+1)
	add_child(void_bullet)
	bull_num += 1
	pass

func _on_m2d_area_entered(area):
	if void_hp > 0:
		if area.name == "void_bullet":
			if hp > 1:
				hp -= 1
			else:
				get_tree().change_scene("res://Scenes/nodie2.tscn")
	pass

func _on_void_area_entered(area):
	if area.name == "kick_bullet":
		void_hp -= 1
	if area.name == "ban_bullet":
		void_hp -= 1
	pass


func _on_cooldown_timeout():
	can_shoot = true
	pass

func _on_fade_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/credits.tscn")
	pass
