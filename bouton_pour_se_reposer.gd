extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "SE REPOSER"

func _desactiver_bouton() -> void:
	Game.peut_se_reposer = false
	text = "INDISPONIBLE"
func _activer_bouton() -> void:
	Game.peut_se_reposer = true
	text = "SE REPOSER"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
