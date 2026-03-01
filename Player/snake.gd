extends CharacterBody2D

const TILE_SIZE = 32

var input_dir: Vector2
var moving = false


func _physics_process(_delta):
	input_dir = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		input_dir = Vector2.LEFT
	elif Input.is_action_pressed("ui_right"):
		input_dir = Vector2.RIGHT
	elif Input.is_action_pressed("ui_down"):
		input_dir = Vector2.DOWN
	elif Input.is_action_pressed("ui_up"):
		input_dir = Vector2.UP

	if not moving: 
		move()
		update_direction(input_dir);

func move():
	if input_dir:
		moving = true
		var tween = create_tween()
		tween.tween_property(self, "position", (position + input_dir*TILE_SIZE), .35)
		tween.tween_callback(stop_move)

func stop_move():
	moving = false

func update_direction(vec: Vector2) -> void:
	match vec:
		Vector2.UP:
			$SnakeHead.rotation_degrees = 0
		Vector2.RIGHT:
			$SnakeHead.rotation_degrees = 90
		Vector2.DOWN:
			$SnakeHead.rotation_degrees = 180
		Vector2.LEFT:
			$SnakeHead.rotation_degrees = 270
