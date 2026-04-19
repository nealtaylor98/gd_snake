extends Node

const x_offset = 58
const y_offset = 144


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fruit_fruit_collected() -> void:
	$Fruit/EatFruit.play()
	var x = randi_range(0, 12)
	var y = randi_range(0, 12)
	$Fruit.position.x = x_offset + (x * 32)
	$Fruit.position.y = y_offset + (y * 32)