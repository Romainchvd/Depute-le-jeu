extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Visibilité".text = "Visibilité: " + str(Game.jauge_visibilité) + "%"
	$"Probité".text = "Probité: " + str(Game.jauge_probité) + "%"
	$"Santé".text = "Santé mentale: " + str(Game.jauge_santé_mentale) + "%"
	$"Démagogie".text = "Démagogie: " + str(Game.jauge_démagogie) + "%"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fermer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/affichage du tour.tscn")
