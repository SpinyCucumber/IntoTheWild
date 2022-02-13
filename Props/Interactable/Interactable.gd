extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const ActionHint = preload("res://Gui/ActionHint/ActionHint.tscn");
const keys = ['E', 'Q'];

var can_interact = false setget set_can_interact

func _ready():
	var i = 0;
	for action in $Actions.get_children():
		var action_hint = ActionHint.instance();
		action_hint.action_name = action.action_name;
		action_hint.action_key = keys[i];
		$ActionHints.add_child(action_hint);
		i += 1

func set_can_interact(value):
	$ActionHints.visible = value;
	can_interact = value;

func _input(event):
	if can_interact:
		var index = null;
		if event.is_action_pressed("interact_primary"):
			index = 0
		elif event.is_action_pressed("interact_secondary"):
			index = 1
		if index != null: call($Actions.get_child(index).method);
