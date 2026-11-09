class_name PlayerWeapons
extends CharacterWeapons

func _process(delta : float):
	var mouse_pos = get_global_mouse_position()
	var mouse_dir = global_position.direction_to(mouse_pos)
	
	if current_weapon:
		current_weapon.set_aim_direction(mouse_dir)
		
		if Input.is_action_just_pressed("attack"):
			current_weapon._try_use()
