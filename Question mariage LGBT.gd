extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gauche_pressed() -> void:
	Game.Mariage_lgbt = Game.Position_politique.GAUCHE
	prochaine_question()


func _on_centre_pressed() -> void:
	Game.Mariage_lgbt = Game.Position_politique.CENTRE
	prochaine_question()


func _on_droite_pressed() -> void:
	Game.Mariage_lgbt = Game.Position_politique.DROITE
	prochaine_question()

func prochaine_question() -> void:
	hide()
	$"../PDM".show()
