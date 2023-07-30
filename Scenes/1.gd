extends Node2D

var enemy_attackable = false
var hp = 10

func _ready():
	pass

func _process(delta):
	$Crosshair.position = get_viewport().get_mouse_position()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$UziHealth.text = "Uzi Health: "+str(hp)
	if (hp <= 0):
		get_tree().change_scene("res://Scenes/v1.tscn")

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if (enemy_attackable == true):
				$UziArea/Uzi.play("hurt")
				$saying.hide()
				hp -= 0.25
				randomize()
				var x = rand_range(100, 1200)
				randomize()
				var y = rand_range(100, 600)
				$UziArea.position.x = x
				$UziArea.position.y = y

func _on_UziArea_mouse_entered():
	enemy_attackable = true
	pass


func _on_UziArea_mouse_exited():
	enemy_attackable = false
	pass
