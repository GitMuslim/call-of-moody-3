extends Node2D

var cur_place = 2
var summon_form = 0
var sd_p = preload("res://Scenes/dd1.tscn")

func _ready():
	VisualServer.set_default_clear_color(Color8(135, 206, 235,1.0))
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		if cur_place < 3:
			cur_place += 1
	if Input.is_action_just_pressed("ui_left"):
		if cur_place > 1:
			cur_place -= 1
	if cur_place == 1:
		$plr.position.x = 525
	if cur_place == 2:
		$plr.position.x = 650
	if cur_place == 3:
		$plr.position.x = 775
	$Camera2D.position.y = $plr.position.y
	$plr.position.y += 5
	if $plr.position.y > 33664:
		Globals.portal_l = 4
		get_tree().change_scene("res://Scenes/com3_1.tscn")
	pass


func _on_summon_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	summon_form = rng.randi_range(0, 3)
	var sd = sd_p.instance()
	if summon_form == 0:
		sd = sd_p.instance()
		sd.position.x = 525
		sd.position.y = $plr.position.y + 750
		add_child(sd)
		sd = sd_p.instance()
		sd.position.x = 650
		sd.position.y = $plr.position.y + 750
		add_child(sd)
	elif summon_form == 1:
		sd = sd_p.instance()
		sd.position.x = 525
		sd.position.y = $plr.position.y + 750
		add_child(sd)
		sd = sd_p.instance()
		sd.position.x = 775
		sd.position.y = $plr.position.y + 750
		add_child(sd)
	elif summon_form == 2:
		sd = sd_p.instance()
		sd.position.x = 650
		sd.position.y = $plr.position.y + 750
		add_child(sd)
		sd = sd_p.instance()
		sd.position.x = 775
		sd.position.y = $plr.position.y + 750
		add_child(sd)
	elif summon_form == 3:
		sd = sd_p.instance()
		sd.position.x = 650
		sd.position.y = $plr.position.y + 750
		add_child(sd)
	pass
