extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const StickDrop= preload("res://Items/Stick/StickDrop.tscn")

func spawn_stick():
	var stick = StickDrop.instance();
	Globals.area_system.current_area.add_child(stick);
	stick.global_position = global_position;
	stick.connect("picked_up", self, "_on_stick_picked_up")

func _on_stick_picked_up():
	$StickTimer.start();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
