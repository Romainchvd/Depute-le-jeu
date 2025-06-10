extends Control

var label_points_action 
var label_tour_actuel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Game.event_disponible == true:
		$Events/Notification.show()
	else:
		$Events/Notification.hide()
	label_points_action = $"Points d'action actuel"
	label_tour_actuel = $"Tour actuel"
	$"Drogue/taux drogue".text = str(Game.probabilité_scandale) + "%"
	if Game.action_effectuée_pendant_le_tour == false:
		activer_repos()
	else:
		desactiver_repos()
	if Game.tour_cooldown_QAG < Game.cooldown_QAG:
		desactiver_QAG()
	else:
		activer_QAG()
	if Game.probabilité_scandale <= 0:
		$Drogue/WarningCokeVert.show()
		$Drogue/WarningCokeJaune.hide()
		$Drogue/WarningCokeRouge.hide()
	elif Game.probabilité_scandale > 0 and Game.probabilité_scandale < 2:
		$Drogue/WarningCokeVert.hide()
		$Drogue/WarningCokeJaune.show()
		$Drogue/WarningCokeRouge.hide()
	else:
		$Drogue/WarningCokeVert.hide()
		$Drogue/WarningCokeJaune.hide()
		$Drogue/WarningCokeRouge.show()
func update_affichage_scandale() -> void:
	$"Drogue/taux drogue".text = str(Game.probabilité_scandale) + "%"
	
	
func desactiver_repos() -> void:
	$"Bouton pour se reposer"._desactiver_bouton()

func activer_repos() -> void:
	$"Bouton pour se reposer"._activer_bouton()
	
func activer_QAG() -> void:
	$"Poser une QAG".text = "Poser une QAG (25 PA)"

func desactiver_QAG() -> void:
	$"Poser une QAG".text = "INDISPONIBLE"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bouton_pour_se_reposer_pressed() -> void:
	if Game.tour_actuel >= Game.tour_max:
		check_fin()
	if Game.action_effectuée_pendant_le_tour == false:
		Game.mise_a_jour_valeur_sante_mentale(5)
		Game.mise_a_jour_valeur_visibilité(-1)
		Game.augmenter_points_actions_tour()
		Game.tour_actuel += 1
		label_points_action.update_points_action()
		label_tour_actuel.update_text()
		if fin_coke(Game.probabilité_scandale):
			get_tree().change_scene_to_file("res://scenes/scandale_coke.tscn")
		if Game.tour_cooldown_QAG < Game.cooldown_QAG:
			Game.tour_cooldown_QAG += 1
		if Game.tour_cooldown_QAG == Game.cooldown_QAG:
			activer_QAG()
		check_event()
	


func _on_afficher_stats_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/statistiques.tscn")


func _on_bouton_pour_passer_le_tour_pressed() -> void:
	if Game.tour_actuel >= Game.tour_max:
		check_fin()
	if Game.action_effectuée_pendant_le_tour == false:
		Game.mise_a_jour_valeur_visibilité(-1)
	Game.augmenter_points_actions_tour()
	Game.tour_actuel += 1
	label_points_action.update_points_action()
	label_tour_actuel.update_text()
	Game.action_effectuée_pendant_le_tour = false
	activer_repos()
	if fin_coke(Game.probabilité_scandale):
		get_tree().change_scene_to_file("res://scenes/scandale_coke.tscn")
	if Game.tour_cooldown_QAG < Game.cooldown_QAG:
		Game.tour_cooldown_QAG += 1
	if Game.tour_cooldown_QAG == Game.cooldown_QAG:
			activer_QAG()
	check_event()
	



func _on_voter_pressed() -> void:
	if Game.points_action >= 1:
		Game.action_effectuée_pendant_le_tour = true
		Game.diminuer_points_actions(1)
		label_points_action.update_points_action()
		Game.mise_a_jour_valeur_sante_mentale(-1)
		check_sante()
		Game.mise_a_jour_valeur_probité(1)
		desactiver_repos()
		



func _on_aller_en_commission_pressed() -> void:
	if Game.points_action >= 2:
		Game.action_effectuée_pendant_le_tour = true
		Game.diminuer_points_actions(2)
		label_points_action.update_points_action()
		Game.mise_a_jour_valeur_sante_mentale(-2)
		check_sante()
		Game.mise_a_jour_valeur_visibilité(-1)
		Game.mise_a_jour_valeur_probité(2)
		desactiver_repos()


func _on_déposer_un_amendement_pressed() -> void:
	if Game.points_action >= 4:
		Game.action_effectuée_pendant_le_tour = true
		Game.diminuer_points_actions(4)
		label_points_action.update_points_action()
		Game.mise_a_jour_valeur_probité(2)
		Game.mise_a_jour_valeur_sante_mentale(-1)
		check_sante()
		Game.mise_a_jour_valeur_visibilité(-1)
		desactiver_repos()


func _on_prendre_de_la_coke_pressed() -> void:
	Game.action_effectuée_pendant_le_tour = true
	Game.points_action += 30
	label_points_action.update_points_action()
	Game.mise_a_jour_valeur_probité(-5)
	Game.mise_a_jour_valeur_sante_mentale(5)
	Game.mise_a_jour_probabilité_scandale(0.5)
	desactiver_repos()
	if Game.probabilité_scandale >= 100:
		Game.probabilité_scandale = 100
	update_affichage_scandale()
	if Game.probabilité_scandale > 0 and Game.probabilité_scandale < 2:
		$Drogue/WarningCokeVert.hide()
		$Drogue/WarningCokeJaune.show()
	elif Game.probabilité_scandale > 2:
		$Drogue/WarningCokeJaune.hide()
		$Drogue/WarningCokeRouge.show()
	
func fin_coke(proba_scandale) -> bool:
	return randf() * 100 < proba_scandale


func _on_aller_en_circo_pressed() -> void:
	if Game.points_action >= 2:
		Game.action_effectuée_pendant_le_tour = true
		Game.diminuer_points_actions(2)
		label_points_action.update_points_action()
		Game.mise_a_jour_valeur_sante_mentale(-1)
		check_sante()
		Game.mise_a_jour_valeur_visibilité(1)
		desactiver_repos()


func _on_ecrire_une_tribune_pressed() -> void:
	if Game.points_action >= 5:
		Game.action_effectuée_pendant_le_tour = true
		Game.diminuer_points_actions(5)
		label_points_action.update_points_action()
		Game.mise_a_jour_valeur_sante_mentale(-1)
		check_sante()
		Game.mise_a_jour_valeur_visibilité(2)
		desactiver_repos()


func _on_poser_une_qag_pressed() -> void:
	if Game.tour_cooldown_QAG == Game.cooldown_QAG:
		if Game.points_action >= 25:
			Game.action_effectuée_pendant_le_tour = true
			Game.diminuer_points_actions(25)
			label_points_action.update_points_action()
			Game.mise_a_jour_valeur_sante_mentale(-4)
			check_sante()
			Game.mise_a_jour_valeur_visibilité(10)
			desactiver_repos()
			desactiver_QAG()
			Game.tour_cooldown_QAG = 0
		


func _on_déposer_un_projet_de_loi_pressed() -> void:
	if Game.points_action >= 8:
		Game.action_effectuée_pendant_le_tour = true
		Game.diminuer_points_actions(8)
		label_points_action.update_points_action()
		Game.mise_a_jour_valeur_sante_mentale(-5)
		check_sante()
		Game.mise_a_jour_valeur_visibilité(5)
		Game.mise_a_jour_valeur_probité(5)
		desactiver_repos()


func _on_events_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_events.tscn")

func check_fin() -> void:
	if Game.probabilité_scandale > 2:
		get_tree().change_scene_to_file("res://scenes/fin_député_drogué.tscn")
	elif Game.jauge_santé_mentale < 25:
		get_tree().change_scene_to_file("res://scenes/fin_votre_femme_vous_a_quitté.tscn")
	elif Game.jauge_visibilité > 85:
		get_tree().change_scene_to_file("res://scenes/fin_bête_médiatique.tscn")
	elif Game.jauge_probité > 85:
		get_tree().change_scene_to_file("res://scenes/fin_député_intègre.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/fin_député_intègre_et_connu.tscn")

func check_sante() -> void:
	if Game.jauge_santé_mentale <= 0:
		get_tree().change_scene_to_file("res://scenes/fin_burnout.tscn")

func check_event() -> void:
	
	if Game.tour_actuel % 4 == 0 and Game.tour_actuel != 0 and Game.event_disponible == false:
		if Game.liste_event.size() > 0:
			Game.current_event = Game.liste_event[0]
			Game.liste_event.pop_front()
			Game.event_disponible = true
		if Game.event_disponible == true:
			$Events/Notification.show()
		else:
			$Events/Notification.hide()
