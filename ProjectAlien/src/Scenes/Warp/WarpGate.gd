extends KinematicBody2D

onready var player = get_parent().get_node("Player")

onready var tween = $Tween
var distanceFromSpawn = 60
var rotateSpeed = 0.05


func _process(delta):
	rotate(rotateSpeed)
	var windowWidth = get_viewport_rect().size.x / 2 - distanceFromSpawn
	tween.interpolate_property(self, "position", 
	position, Vector2(windowWidth, position.y), 1, 
	tween.TRANS_LINEAR, tween.EASE_IN)
	

	tween.start()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player.warped()
		get_parent().touchedWarp()
