class_name PlayerWeapons
extends CharacterWeapons

func _ready():
	super._ready()
	
	$"../Inventory".slot_updated.connect(_on_updated_inventory_slot)

func _process(delta : float):
	var mouse_position = get_global_mouse_position()
	var mouse_direction = global_position.direction_to(mouse_position)
	
	if current_weapon:
		current_weapon.set_aim_direction(mouse_direction)
		
		if Input.is_action_just_pressed("attack"):
			if get_viewport().gui_get_hovered_control() == null: # If the currently hovered control node is null
				current_weapon._try_use()
			
	if current_shield:
		current_shield.set_aim_direction(mouse_direction)
		
	if Input.is_action_just_pressed("block"):
		toggle_shield(true)
	elif Input.is_action_just_released("block"):
		toggle_shield(false)

func _on_updated_inventory_slot(slot : Inventory.ItemSlot):
	if slot == weapon_inventory_slot and not slot.item:
		unequip_weapon()
		
	if slot == shield_inventory_slot and not slot.item:
		unequip_shield()
