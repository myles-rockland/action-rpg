class_name CharacterVisual
extends Sprite2D

@export var character : Character

@export var wobble_speed : float = 15 # frequency
@export var wobble_amount : float = 5 # amplitude in degrees

func _ready():
	character.on_take_damage.connect(_on_take_damage)

func _process(delta : float):
	# sprite flipping
	flip_h = character.look_direction.x < 0
	
	# move wobble
	var target_rotation : float = 0
	
	if character.velocity.length() > 1:
		var time = Time.get_unix_time_from_system()
		target_rotation = sin(time * wobble_speed) * wobble_amount
	
	rotation_degrees = lerpf(rotation_degrees, target_rotation, delta * 20)

func _on_take_damage(hit_force : Vector2):
	modulate = Color.BLACK
	await get_tree().create_timer(0.08).timeout
	modulate = Color.WHITE
