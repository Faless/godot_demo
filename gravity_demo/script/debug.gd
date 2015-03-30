
extends Label

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var v = get_parent().get_node("Ball").get_linear_velocity()*100
	var string
	string  = "Vx: " + str(round(v.x)/100.0) + "\n"
	string += "Vy: " + str(round(v.y)/100.0) + "\n"
	string += "Vz: " + str(round(v.z)/100.0) + "\n"
	string += "|V|: " + str(round(v.length())/100.0)
	set_text(string)