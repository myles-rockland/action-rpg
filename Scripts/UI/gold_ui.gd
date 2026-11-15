extends Label

func _ready():
	$"../../..".gold_updated.connect(_on_updated_gold)
	
func _on_updated_gold(gold : int):
	text = str(gold)
