extends Node2D

onready var anim = $AnimationPlayer

func _ready():
	return

func playAnim(animName):
	if animName == "Fade In":
		anim.play("FadeIn")
	elif animName == "Fade Out":
		anim.play("FadeOut")
