extends Control

const ScreenTransition = preload("res://Logic/ScreenTransition/ScreenTransition.tscn")
const AreaSystem = preload("res://Logic/AreaSystem/AreaSystem.tscn")

func start_game():
	queue_free()
	get_parent().add_child(AreaSystem.instance())

func _on_Button_pressed():
	var transition = ScreenTransition.instance();
	transition.connect("do_work", self, "start_game");
	get_parent().add_child(transition);
