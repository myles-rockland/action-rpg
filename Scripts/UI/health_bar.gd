extends Panel

@onready var character : Character = $".."
@onready var fill : Control = $Fill
@onready var max_width : float = fill.size.x

func _ready():
	character.on_health_changed.connect(_update_ui)
	_update_ui()

func _update_ui():
	var health_percent : float = float(character.current_hp) / float(character.max_hp)
	fill.size.x = max_width * health_percent
