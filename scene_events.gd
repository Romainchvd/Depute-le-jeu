extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Game.current_event == Game.Event.FAIBLE_SOUTIENT_RECUL_RETRAITES:
		$"Control/Pas d'event".hide()
		$"Control/Recul retraite".show()
	elif Game.current_event == Game.Event.DEPUTE_DROGUE:
		$"Control/Pas d'event".hide()
		$"Control/Député prend coke".show()
	elif Game.current_event == Game.Event.PROPOSITION_ABOLITION_MARIAGE_LGBT:
		$"Control/Pas d'event".hide()
		$"Control/Event PPL Abrogation mariage LGBT".show()
	elif Game.current_event == Game.Event.PROPOSITION_PEINE_MORT:
		$"Control/Pas d'event".hide()
		$"Control/PPL PDM".show()
	else:
		$"Control/Recul retraite".hide()
		$"Control/Député prend coke".hide()
		$"Control/Event PPL Abrogation mariage LGBT".hide()
		$"Control/PPL PDM".hide()
		$"Control/Pas d'event".show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fermer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/affichage du tour.tscn")
