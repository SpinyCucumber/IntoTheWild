extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const ActionHint = preload("res://Gui/ActionHint/ActionHint.tscn");
const keys = ['E', 'Q'];

export(Array) var actions;
var can_interact = false setget set_can_interact

func _ready():
	var i = 0;
	for action_name in actions:
		var action_hint = ActionHint.instance();
		action_hint.action_name = action_name;
		action_hint.action_key = keys[i];
		$ActionHints.add_child(action_hint);
		i += 1

func set_can_interact(value):
	$ActionHints.visible = value;
	can_interact = value;

func _input(event):
	if can_interact:
		if event.is_action_pressed("interact_primary"):
			call(actions[0])
		elif event.is_action_pressed("interact_secondary"):
			call(actions[1])
