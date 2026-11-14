class_name PortalInteraction
extends Node2D

@export_file("*.tscn") var scene_to_load : String
@export var enter_position : Vector2

func _ready():
	$Interactable.interacted.connect(_on_interact)

func _on_interact(player : Player):
	var scene : PackedScene = load(scene_to_load)
	GameManager.change_scene(scene, enter_position)
