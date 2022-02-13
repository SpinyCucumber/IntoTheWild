extends Label

var action_name;
var action_key;

# Called when the node enters the scene tree for the first time.
func _ready():
	text = action_key + " - " + action_name;
