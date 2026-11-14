class_name ShieldItemData
extends ItemData

func _select_in_inventory(player : Player, item_slot : Inventory.ItemSlot):
	var is_equipped : bool = player.weapons.shield_inventory_slot == item_slot
	
	if is_equipped:
		player.weapons.unequip_shield()
		player.weapons.shield_inventory_slot = null
	else:
		player.weapons.equip_shield(self)
		player.weapons.shield_inventory_slot = item_slot
		
	player.inventory.inventory_updated.emit()
