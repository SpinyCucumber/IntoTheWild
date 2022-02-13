extends "res://Props/Interactable/Interactable.gd"

signal picked_up

func pickup():
	# TODO
	emit_signal("picked_up")
	queue_free()
