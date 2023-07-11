extends Node2D

var text_array = ["he should be here!", "something's wrong, i have to find him."]
var cur_text = -1

func _on_change_text_timeout():
	if (cur_text == 1):
		get_tree().change_scene("res://Scenes/LevelSelector.tscn")
	if (cur_text < 1):
		cur_text += 1
		$saying.text = text_array[cur_text]
	pass
