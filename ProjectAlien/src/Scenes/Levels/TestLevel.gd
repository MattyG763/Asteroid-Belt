extends Node2D

onready var animFade = get_node("FadeInOut")

onready var levelNameTween = $LevelNameTween
onready var levelNameText = $LevelNameText
onready var levelNameTimer = $LevelNameTimer

onready var SceneTimer = $ChangeSceneTimer
onready var audio = $music

export var scene = ""

func _ready():
	levelNameTimer.start()
	levelNameText.percent_visible = 0
	showLevelName()
	
	animFade.playAnim("Fade Out")
	audio.pitch_scale = rand_range(0.8, 1)

func touchedWarp():
	animFade.playAnim("Fade In")
	SceneTimer.start()

func _on_ChangeSceneTimer_timeout():
	get_tree().change_scene("res://src/Scenes/Levels/" + scene + ".tscn")

func showLevelName():
	levelNameTween.interpolate_property(levelNameText, "percent_visible",
	levelNameText.percent_visible, 1, 5, levelNameTween.TRANS_LINEAR, levelNameTween.EASE_IN)
	levelNameTween.start()
	
	levelNameText.text = get_tree().current_scene.name


func _on_LevelNameTimer_timeout():
	levelNameTween.interpolate_property(levelNameText, "percent_visible",
	levelNameText.percent_visible, 0, 5, levelNameTween.TRANS_LINEAR, levelNameTween.EASE_OUT)
	levelNameTween.start()
	
