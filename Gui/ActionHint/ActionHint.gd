extends Label

var action_name
var key_num

var key_names = ['E', 'Q', 'R'];

# Called when the node enters the scene tree for the first time.
func _ready():
	text = key_names[key_num] + " - " + action_name;
