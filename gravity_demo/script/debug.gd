
extends Label

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var v = get_parent().get_node("Ball").get_linear_velocity()
	set_text(str(v) + "\n" + str(v.length()))