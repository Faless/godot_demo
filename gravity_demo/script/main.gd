
extends Spatial

var menu_open = true
var pause = true
var current
var menu

var cams
var curr_cam = 1

func _ready():
	current = get_node("Current")
	menu = get_node("Main Menu")
	cams = get_tree().get_nodes_in_group("cam")
	get_tree().set_pause(pause)
	set_process_input(true)
	pass

func _input(event):
	if (event.is_action("main_menu") || event.is_action("pause")) && event.is_pressed() && !event.is_echo():
		if event.is_action("main_menu"):
			pause = menu_open
			toggle_pause()
			toggle_menu()
		elif not menu_open:
			toggle_pause()
	if event.is_action("change_cam") && event.is_pressed() && !event.is_echo() && cams.size() > 0:
		curr_cam += 1
		if curr_cam >= cams.size():
			curr_cam = 0
		cams[curr_cam].make_current()

func clear_demo():
	cams = get_tree().get_nodes_in_group("cam")
	for c in cams:
		c.remove_from_group("cam")
	var child = current.get_child(0)
	if child:
		child.queue_free()

func load_scene(scene):
	var s = ResourceLoader.load(scene)
	current.add_child(s.instance())
	cams = get_tree().get_nodes_in_group("cam")
	curr_cam = 0
	cams[curr_cam].make_current()

func toggle_pause():
	pause = !pause
	get_tree().set_pause(pause)

func toggle_menu():
	menu_open = !menu_open
	if menu_open:
		get_node("Main Menu").show()
	else:
		get_node("Main Menu").hide()

func _on_Exit_pressed():
	OS.get_main_loop().quit()

func _on_Demo1_pressed():
	toggle_menu()
	clear_demo()
	load_scene("res://demo/thedemo1.scn")

func _on_Demo2_pressed():
	toggle_menu()
	clear_demo()
	load_scene("res://demo/thedemo2.scn")

func _on_Demo3_pressed():
	toggle_menu()
	clear_demo()
	load_scene("res://demo/thedemo3.scn")

func _on_Clear_pressed():
	clear_demo()
