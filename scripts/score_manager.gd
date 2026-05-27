extends Node

var deaths = 0
var score = 0
var death_registered = false

func add_score():
	score += 1

func add_death():
	if death_registered:
		return
	death_registered = true
	deaths += 1

func reset():
	score = 0
	death_registered = false
