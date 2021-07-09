extends Node

onready var animWin = $WinLoseScreen/AnimationPlayer
onready var animHowToPlay = $HowToPlayScreen/AnimationPlayer
onready var storyScreenAnim = $StoryScene/AnimationPlayer

onready var storyScene = $StoryScene

onready var timer = $ChangeSceneTimer
export var scene = "Name Of Level"

func _ready():
	animWin.play("FadeOut")
	return 

func _on_PlayButton_pressed():
	timer.start()
	animWin.play("FadeIn")

func _on_ChangeSceneTimer_timeout():
	get_tree().change_scene("res://src/Scenes/Levels/" + scene + ".tscn")


func _on_HowToPlayButton_pressed():
	animHowToPlay.play("ScrollRight")

func _on_StoryButton_pressed():
	storyScreenAnim.play("StoryScrollRight")
	storyScene.showText()
	

func _on_HowToPlayScreen_mainMenuPressed():
	animHowToPlay.play("ScrollLeft")

func _on_StoryScene_mainMenuPressed():
	storyScreenAnim.play("StoryScrollLeft")
