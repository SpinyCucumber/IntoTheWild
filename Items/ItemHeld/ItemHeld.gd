extends "res://Props/Interactable/Interactable.gd"

func _ready():
	set_can_interact(true);

func drop():
	set_can_interact(false);
	Globals.player.drop_item()
