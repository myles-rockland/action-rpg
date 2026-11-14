class_name PortalInteraction
extends Node2D

@export var scene_to_load : PackedScene

func _ready():
	$Interactable.interacted.connect(_on_interact)

func _on_interact(player : Player):
	get_tree().change_scene_to_packed(scene_to_load)
