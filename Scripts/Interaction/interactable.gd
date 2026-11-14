class_name Interactable
extends Area2D

signal interacted(player : Player)

@export var prompt : String = "Pickup Item"
@export var single_use : bool = false
var can_interact : bool = true

func try_interact(player : Player):
	if not can_interact:
		return
		
	interacted.emit(player)
	
	if single_use:
		can_interact = false
