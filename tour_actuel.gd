extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Tour actuel : " + str(Game.tour_actuel) + "/" + str(Game.tour_max)

func update_text() -> void:
	text = "Tour actuel : " + str(Game.tour_actuel) + "/" + str(Game.tour_max)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
