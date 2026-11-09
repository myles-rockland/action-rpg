class_name Character
extends CharacterBody2D

signal on_take_damage(direction : Vector2)
signal on_health_changed

@export var current_hp : int = 10
@export var max_hp : int = 10

@export var move_speed : float = 20
@export var force_drag : float = 5
@export var weight : float = 1.0

@export var weapons : CharacterWeapons
@export var damaged_sound : AudioStream

var move_input : Vector2
var look_direction : Vector2

var external_force : Vector2

func _physics_process(delta: float) -> void:
	_move(delta)
	
func _move(delta : float) -> void:
	velocity = move_input * move_speed
	external_force = external_force.lerp(Vector2.ZERO, force_drag * delta)
	velocity += external_force
	move_and_slide()
	
func take_damage(damage : int, force : Vector2):
	if weapons.try_block_direction(force.normalized()):
		return
	
	current_hp -= damage
	add_force(force)
	AudioManager.play(damaged_sound)
	
	if current_hp <= 0:
		_die()
	else:
		on_take_damage.emit(force)
		on_health_changed.emit()

func _die():
	pass
	
func heal(amount : int):
	pass
	
func add_force(force : Vector2):
	external_force += force / weight
