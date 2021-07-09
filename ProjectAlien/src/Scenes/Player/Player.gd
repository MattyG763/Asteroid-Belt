extends KinematicBody2D

onready var anim = $AnimationPlayer
onready var tween = $Tween
onready var audio = $Sounds

export var speed = 6000

var velocity = Vector2.ZERO
var gameStart = true

func _ready():
	gameStart = true

func _physics_process(delta):
	playerBoundaries()
	get_input(delta)
	velocity = move_and_slide(velocity)


func warped():
	gameStart = false
	
	var portal = get_parent().get_node("WarpGate")
	var spawner = get_parent().get_node("Spawner")
	var fuel = get_parent().get_node("FuelGauge")
	
	$CollisionShape2D.set_deferred("disabled", 1)
	
	tween.interpolate_property(self, "position",
	position, Vector2(portal.position.x,
	 portal.position.y), 0.5, 
	tween.TRANS_LINEAR, tween.EASE_IN)
	
	tween.start()
	
	fuel.gameStart = false
	spawner.gameStart = false

	anim.play("spinning")


func get_input(delta):
	if gameStart:
		#Calculate and apply the movement of the player
		var direction = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
								Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
		velocity = speed * direction * delta

func playerBoundaries():
	#keep player within the bounds of the game
	var windowLeft = 0 + 25
	var windowRight = get_viewport_rect().size.x / 2 - 25
	var windowTop = 0 + 20
	var windowBottom = get_viewport_rect().size.y / 2 - 20
	
	if position.x <= windowLeft:
		position.x = windowLeft
	elif position.x >= windowRight:
		position.x = windowRight
	
	if position.y <= windowTop:
		position.y = windowTop
	elif position.y >= windowBottom:
		position.y = windowBottom

func playAnim(effect):
	if effect == "hurt":
		anim.play("hurtAnim")
	elif effect == "heal":
		anim.play("healAnim")
