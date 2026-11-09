extends Node

var audio_players : Array[AudioStreamPlayer]

func play(stream : AudioStream):
	var audio_player = _get_available_audio_player()
	audio_player.stream = stream
	audio_player.play()

func _get_available_audio_player() -> AudioStreamPlayer:
	for audio_player in audio_players:
		if not audio_player.playing:
			return audio_player
			
	return _create_new()
	
func _create_new() -> AudioStreamPlayer:
	var audio_player : AudioStreamPlayer = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_players.append(audio_player)
	return audio_player
