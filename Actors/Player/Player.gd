extends Actor

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var walk_accel = 3000.0 # Distance units/second^2
export var walk_speed_max = 100.0
export var air_accel = 5.0;
export var walk_friction = 1e-15;

const FLOOR_DETECT_DISTANCE = 20.0
var current_anim;
var held_item;

onready var hand = $Sprite/Arms/Hand;

func _ready():
	Globals.player = self

func _physics_process(_delta):
	# Update horizontal velocity based on input
	var dir = get_input_direction();
	var next_anim = null;
	if is_on_floor():
		if abs(dir) > 0:
			_velocity.x = get_input_direction() * walk_accel * _delta;
			# Cap maximum horizontal velocity on ground
			if abs(_velocity.x) > walk_speed_max:
				_velocity.x = sign(_velocity.x) * walk_speed_max;
			# Change direction of sprite
			$Sprite.scale.x = sign(dir) * abs($Sprite.scale.x);
			next_anim = "Walk";
		else:
			# Apply friction on ground
			_velocity.x *= pow(walk_friction, _delta);
			if abs(_velocity.x) < 1e-2:
				_velocity.x = 0
	else:
		_velocity.x += get_input_direction() * air_accel * _delta;
	# Update animation
	if next_anim != current_anim:
		if next_anim == null:
			$AnimationPlayer.play("RESET");
		else:
			$AnimationPlayer.play(next_anim);
		current_anim = next_anim
	# Snap to slopes
	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE
	_velocity = move_and_slide_with_snap(_velocity, snap_vector, FLOOR_NORMAL, true);

# Direction user is inputting along x-axis
func get_input_direction():
	return Input.get_action_strength("move_right") - Input.get_action_strength("move_left");

func hold_item(item):
	held_item = item;
	hand.add_child(item.Held.instance());	

func drop_item():
	hand.get_child(0).queue_free();
	var drop = held_item.Drop.instance();
	held_item = null;
	Globals.area_system.current_area.add_child(drop);
	drop.global_position = hand.global_position;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
