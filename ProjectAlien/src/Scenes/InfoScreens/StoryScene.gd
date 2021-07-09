extends Node2D

signal mainMenuPressed

onready var text = $RichTextLabel
onready var tween = $Tween

func _ready():
	text.percent_visible = 0

func _on_Button_pressed():
	emit_signal("mainMenuPressed")
	text.percent_visible = 0
	

func showText():
	tween.interpolate_property(text, "percent_visible", 
	text.percent_visible, 1, 10, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	
	tween.start()
