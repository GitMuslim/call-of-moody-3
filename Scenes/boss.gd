extends Node2D

func _ready():
	VisualServer.set_default_clear_color(Color8(92, 64, 51,1.0))
	pass

func _process(delta):
	$Camera2D.position.x = $m2d.position.x
	pass

func _on_anim1_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/boss1.tscn")
	pass
