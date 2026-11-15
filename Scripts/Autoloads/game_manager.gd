extends Node

var player : Player
var camera : Camera2D

func play_game():
	get_tree().change_scene_to_file("res://Scenes/overworld.tscn")

func change_scene(scene : PackedScene, player_position : Vector2):
	get_tree().change_scene_to_packed(scene)
	
	player.global_position = player_position
	camera.global_position = player_position
	
	await get_tree().process_frame
	
	get_tree().root.move_child(player, get_tree().root.get_child_count() - 1)

func game_over():
	player.queue_free.call_deferred()
	camera.queue_free.call_deferred()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
