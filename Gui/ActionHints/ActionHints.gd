extends Node2D

const ActionHint = preload("res://Gui/ActionHint/ActionHint.tscn");

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



var actions;
var bound_keys;

func _ready():
	var i = 0;
	bound_keys = [];
	for action in actions:
		var key = InteractionSystem.request_key();
		if key != null:
			bound_keys.append(key);
			var action_hint = ActionHint.instance();
			action_hint.action_name = action.action_name;
			action_hint.key_num = key;
			$Control.add_child(action_hint);
			i += 1

func queue_free():
	for key in bound_keys:
		InteractionSystem.free_key(key);
	.queue_free()

# TODO Input
