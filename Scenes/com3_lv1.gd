extends Node2D

var cur_place = 2

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
		$m2d.position.x = 525
	if cur_place == 2:
		$m2d.position.x = 650
	if cur_place == 3:
		$m2d.position.x = 775
	$Camera2D.position.y = $m2d.position.y
	$m2d.position.y += 5
	pass
