extends Node2D

const section_time := 2.0
const line_time := 0.3
const base_speed := 100
const speed_up_multiplier := 10.0
const title_color := Color.blueviolet

var scroll_speed := base_speed
var speed_up := false

onready var line := $CreditsContainer/Line
var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
	[
		"Un juego de Team 19"
	],[
		"Programación y testeo",
		"Cristian Barraza",
		"Felipe Salgado"
	],[
		"Arte y modelos 3D",
		"Graphics Pack: Interface Elements: Gothic Red ",
		"Evolutionary Games",
		"",
		"Jupiter's Font Bundle",
		"Jupiter Hadley",
		"",
		"Scenes from Oriax",
		"Wisedawn",
		"",
		"Kenney Tower Defense Kit",
		"https://kenney.nl/assets/tower-defense-kit",
		"",
		"Goblin",
		"Markus Kothe",
		"https://www.thingiverse.com/thing:2772094"
	],[
		"Musica",
		"Dark Background Cave #2",
		"Solar Phase",
		"",
		"Tim Beek - The Protagonist",
		"Tim Beek"
	],[
		"Efectos de Sonido",
	],
		
	[
		"Herramientas Utilizadas",
		"Developed with Godot Engine",
		"https://godotengine.org/license",
		"",
		"godot-credits",
		"Ben Bishop"
	],[
		"Agradecimientos",
		"Elias Zelada profe 10/10",
		"Curso CC5408 Taller Diseño Videojuegos",
		"Purato-Kun",
		
	]
]


func _process(delta):
	var scroll_speed = base_speed * delta
	
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	
	if speed_up:
		scroll_speed *= speed_up_multiplier
	
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()


func finish():
	if not finished:
		finished = true
		# NOTE: This is called when the credits finish
		# - Hook up your code to return to the relevant scene here, eg...
		get_tree().change_scene("res://Menu_Principal.tscn")


func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_color_override("font_color", title_color)
	$CreditsContainer.add_child(new_line)
	
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		finish()
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
