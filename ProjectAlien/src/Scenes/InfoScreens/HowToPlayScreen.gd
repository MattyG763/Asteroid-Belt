extends Node2D

signal mainMenuPressed

func _on_Button_pressed():
	emit_signal("mainMenuPressed")
