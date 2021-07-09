extends Node2D

onready var fuel = preload("res://src/Scenes/Fuel/Fuel.tscn")
onready var asteroidInst = preload("res://src/Scenes/Enemies/Asteroid.tscn")

onready var portalInst = preload("res://src/Scenes/Warp/WarpGate.tscn")


onready var fuelTimer = $FuelTimer
onready var asteroidTimer = $AsteroidTimer
onready var warpTime = $WarpTimer

var gameStart = true

func _ready():
	gameStart = true
	fuelTimer.start()
	asteroidTimer.start()
	warpTime.start()

func spawnObject(object):
	var windowWidth = get_viewport_rect().size.x / 2 + 20
	var windowHeight = get_viewport_rect().size.y / 2
	
	if gameStart:
		if object == asteroidInst:
			object = asteroidInst.instance()
		elif object == fuel:
			object = fuel.instance()
			
		object.position = Vector2(windowWidth, rand_range(10, windowHeight))
		get_parent().add_child(object)


func spawnWarp():
	var windowWidth = get_viewport_rect().size.x / 2 + 20
	var windowHeight = get_viewport_rect().size.y / 2
	var portal = portalInst.instance()
	portal.z_index = -5
	portal.position = Vector2(windowWidth, windowHeight / 2)
	get_parent().add_child(portal)


func _on_Timer_timeout():
	spawnObject(fuel)

func _on_AsteroidTimer_timeout():
	spawnObject(asteroidInst)
	
func _on_WarpTimer_timeout():
	spawnWarp()


