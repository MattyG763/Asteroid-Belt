extends KinematicBody2D

onready var fuelGauge = get_parent().get_node("FuelGauge")
onready var player = get_parent().get_node("Player")
onready var playerSounds = player.get_node("Sounds")

var moveSpeed = 0.8
var rotationSpeed = 0.05

func _ready():
	z_index = -2

func _process(delta):
	rotate(-rotationSpeed)
	position.x -= moveSpeed

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player.playAnim("heal")
		playerSounds.playSound("heal")
		fuelGauge.refillFuel()
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
