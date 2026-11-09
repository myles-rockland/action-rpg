class_name EnemyWeapons
extends CharacterWeapons

@onready var me : Enemy = $".."

func _process(delta : float):
	if not current_weapon:
		return
		
	var target_direction : Vector2 = global_position.direction_to(me.target.global_position)
	var target_distance : float = global_position.distance_to(me.target.global_position)
	
	current_weapon.set_aim_direction(target_direction)
	
	if target_distance <= current_weapon.range:
		current_weapon._try_use()
