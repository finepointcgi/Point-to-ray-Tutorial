extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vector = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		vector.y = -1
	if Input.is_action_pressed("ui_down"):
		vector.y = 1
	if Input.is_action_pressed("ui_right"):
		vector.x = 1
	if Input.is_action_pressed("ui_left"):
		vector.x = -1
	move_and_slide(Vector3(vector.x * 10 , -(delta * gravity), vector.y * 10) )
	pass
