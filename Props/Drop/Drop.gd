extends "res://Props/Interactable/Interactable.gd"

signal picked_up

export(String) var item_name

func pickup():
	emit_signal("picked_up");
	Globals.player.hold_item(Items.get(item_name));
	queue_free();

func enter_range():
	if !Globals.player.held_item:
		set_can_interact(true);

func leave_range():
	if can_interact:
		set_can_interact(false);
