extends Node

var all_coins = 0
var add_coins = 0
var game_stage = 1
var portal_l = 1
var selection = 1

var file = File.new()

func _ready():
	if file.file_exists("user://coins.dat") == true:
		file.open("user://coins.dat", File.READ)
		all_coins = int(file.get_line())
	if file.file_exists("user://stage.dat") == true:
		file.open("user://stage.dat", File.READ)
		game_stage = int(file.get_line())
	if file.file_exists("user://portal.dat") == true:
		file.open("user://portal.dat", File.READ)
		portal_l = int(file.get_line())
	pass

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _save_stuff():
	file = File.new()
	file.open("user://coins.dat", File.WRITE)
	file.store_line(str(all_coins))
	file.close()
	file = File.new()
	file.open("user://stage.dat", File.WRITE)
	file.store_line(str(game_stage))
	file.close()
	file = File.new()
	file.open("user://portal.dat", File.WRITE)
	file.store_line(str(portal_l))
	file.close()
