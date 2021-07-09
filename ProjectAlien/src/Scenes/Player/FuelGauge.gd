extends ColorRect

var fuelLoss = 0.1
var maxFuel = 10

func _process(delta):
	rect_size.x -= fuelLoss

func refillFuel():
	rect_size.x = maxFuel


