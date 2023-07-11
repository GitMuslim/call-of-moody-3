extends Node2D

var enemy_attackable = false
var hp = 10

func _ready():
	pass

func _process(delta):
	$Crosshair.position = get_viewport().get_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$AwwHealth.text = "Aww549 Health: "+str(hp)
	if (hp <= 0):
		get_tree().change_scene("res://Scenes/v2.tscn")

func _input(event):
	if Input.is_action_just_pressed("attack"):
		if (enemy_attackable == true):
			$AwwArea/Aww.play("hurt")
			$saying.hide()
			hp -= 0.25
			randomize()
			var x = rand_range(100, 1200)
			randomize()
			var y = rand_range(100, 600)
			$AwwArea.position.x = x
			$AwwArea.position.y = y

func _on_AwwArea_mouse_entered():
	enemy_attackable = true
	pass

func _on_AwwArea_mouse_exited():
	enemy_attackable = false
	pass
