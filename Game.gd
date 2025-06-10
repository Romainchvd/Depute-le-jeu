extends Node

enum Event {NONE, DEPUTE_DROGUE, FAIBLE_SOUTIENT_RECUL_RETRAITES, PROPOSITION_ABOLITION_MARIAGE_LGBT, PROPOSITION_PEINE_MORT}
enum Position_politique {GAUCHE, CENTRE, DROITE, PAS_POSITION}

var tour_actuel = 1
var tour_max = 60
var points_action = 10
var jauge_probité = 50
var jauge_visibilité = 50
var jauge_démagogie = 0
var jauge_santé_mentale = 100
var probabilité_scandale = 0
var points_action_par_tour = 5
var peut_se_reposer = true
var cooldown_QAG = 5
var tour_cooldown_QAG = 5
var nom_joueur = "Joueur"
var action_effectuée_pendant_le_tour = false
var event_disponible = false
var current_event = Event.NONE
var liste_event = [Event.DEPUTE_DROGUE, Event.FAIBLE_SOUTIENT_RECUL_RETRAITES, Event.PROPOSITION_ABOLITION_MARIAGE_LGBT, Event.PROPOSITION_PEINE_MORT]
var Retraites = new().Position_politique.PAS_POSITION
var Mariage_lgbt = new().Position_politique.PAS_POSITION
var pdm = new().Position_politique.PAS_POSITION

func reset_game() -> void:
	randomize()
	tour_actuel = 1
	tour_max = 60
	points_action = 10
	jauge_probité = 50
	jauge_visibilité = 50
	jauge_démagogie = 0
	jauge_santé_mentale = 100
	probabilité_scandale = 0
	points_action_par_tour = 5
	peut_se_reposer = true
	cooldown_QAG = 5
	tour_cooldown_QAG = 5
	nom_joueur = "Joueur"
	action_effectuée_pendant_le_tour = false
	event_disponible = false
	current_event = Event.NONE
	liste_event = [Event.DEPUTE_DROGUE, Event.FAIBLE_SOUTIENT_RECUL_RETRAITES, Event.PROPOSITION_ABOLITION_MARIAGE_LGBT, Event.PROPOSITION_PEINE_MORT]
	Retraites = new().Position_politique.PAS_POSITION
	Mariage_lgbt = new().Position_politique.PAS_POSITION
	pdm = new().Position_politique.PAS_POSITION
	liste_event.shuffle()


func _ready() -> void:
	randomize()
	liste_event.shuffle()
func augmenter_points_actions_tour() -> void:
	points_action += points_action_par_tour
	
func diminuer_points_actions(valeur) -> void:
	points_action -= valeur
	if points_action < 0:
		points_action = 0
	
func mise_a_jour_valeur_probité(valeur) -> void:
	jauge_probité += valeur
	if jauge_probité < 0:
		jauge_probité = 0
	elif jauge_probité > 100:
		jauge_probité = 100

func mise_a_jour_valeur_visibilité(valeur) -> void:
	jauge_visibilité += valeur
	if jauge_visibilité < 0:
		jauge_visibilité = 0
	elif jauge_visibilité > 100:
		jauge_visibilité = 100
	
func mise_a_jour_valeur_sante_mentale(valeur) -> void:
	jauge_santé_mentale += valeur
	if jauge_santé_mentale < 0:
		jauge_santé_mentale = 0
	elif jauge_santé_mentale > 100:
		jauge_santé_mentale = 100

func mise_a_jour__valeur_démagogie(valeur) -> void:
	jauge_démagogie += valeur
	if jauge_démagogie < 0:
		jauge_démagogie = 0
	elif jauge_démagogie > 100:
		jauge_démagogie = 100

func mise_a_jour_probabilité_scandale(valeur) -> void:
	probabilité_scandale += valeur
	
func changer_nom(nom) -> void:
	nom_joueur = nom
