extends Node

var keys = [false, false, false];

func request_key():
	# First first key not in use
	for i in range(len(keys)):
		if !keys[i]:
			keys[i] = true;
			return i;
	return null;

func free_key(i):
	keys[i] = false;
