extends "res://Props/Interactable/Interactable.gd"


export(String) var area_name
export(String) var spawn_name

func use():
	Globals.area_system.transition_area(area_name, spawn_name);
