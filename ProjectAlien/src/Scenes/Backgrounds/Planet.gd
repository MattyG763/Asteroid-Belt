extends Node2D

func _process(delta):
	var planets = get_children()
	for planet in planets:
		planet.z_index = -10
		planet.position.x -= 1.3
		if planet.position.x < -541:
			planet.position.x = 542 * 2
