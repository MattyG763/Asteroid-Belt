extends Node2D

onready var background = [get_node("bg1"), get_node("bg2")]

func _process(delta):
	for bg in background:
		bg.position.x -= 1
		if bg.position.x < -541:
			bg.position.x = 542
