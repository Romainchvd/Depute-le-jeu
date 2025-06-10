extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Points d'action: " + str(Game.points_action)

func update_points_action() -> void:
	text = "Points d'action: " + str(Game.points_action)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
