extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const ActionHints = preload("res://Gui/ActionHints/ActionHints.tscn");
const interact_actions = ["interact_primary", "interact_secondary", "interact_tertiary"];

var can_interact = false setget set_can_interact
var hints: Node;

func set_can_interact(value):
	can_interact = value;
	if value:
		hints = ActionHints.instance();
		hints.actions = $Actions.get_children();
		# Might change parent later
		get_tree().root.add_child(hints);
	else:
		hints.queue_free();
		hints = null;

func _process(_delta):
	if hints:
		hints.global_position = global_position

func _input(event):
	if can_interact:
		for i in range(len(interact_actions)):
			if event.is_action_pressed(interact_actions[i]):
				var action_index = hints.bound_keys.find(i)
				if action_index != -1:
					var method = $Actions.get_child(action_index).method;
					call(method);
			
