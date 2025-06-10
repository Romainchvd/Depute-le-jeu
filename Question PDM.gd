extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gauche_pressed() -> void:
	Game.pdm = Game.Position_politique.GAUCHE
	get_tree().change_scene_to_file("res://scenes/affichage du tour.tscn")


func _on_droite_pressed() -> void:
	Game.pdm = Game.Position_politique.DROITE
	get_tree().change_scene_to_file("res://scenes/affichage du tour.tscn")
