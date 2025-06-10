extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_critiquer_pressed() -> void:
	if Game.points_action >= 10:
		Game.diminuer_points_actions(10)
		if Game.probabilité_scandale == 0:
			Game.mise_a_jour_valeur_probité(20)
			Game.mise_a_jour_valeur_visibilité(5)
		else:
			Game.mise_a_jour_valeur_probité(-20)
			Game.mise_a_jour_valeur_visibilité(5)
		Game.event_disponible = false
		Game.current_event = Game.Event.NONE
		hide()
		$"../Pas d'event".show()


func _on_soutenir_pressed() -> void:
	if Game.points_action >= 10:
		Game.diminuer_points_actions(10)
		if Game.probabilité_scandale > 0:
			Game.mise_a_jour_valeur_probité(10)
			Game.mise_a_jour_valeur_visibilité(10)
		else:
			Game.mise_a_jour_valeur_probité(-10)
			Game.mise_a_jour_valeur_visibilité(10)
		Game.event_disponible = false
		Game.current_event = Game.Event.NONE
		hide()
		$"../Pas d'event".show()
