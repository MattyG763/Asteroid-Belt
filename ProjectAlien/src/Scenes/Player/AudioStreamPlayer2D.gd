extends AudioStreamPlayer2D

onready var heal = load("res://src/SoundFX/Powerup2.wav")
onready var hurt = load("res://src/SoundFX/Hit.wav")

func playSound(soundName):
	
	match(soundName):
		"heal":
			pitch_scale = rand_range(1, 2)
			stream = heal
		"hurt":
			pitch_scale = rand_range(-1, -2)
			stream = hurt
	
	play()
