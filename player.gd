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
	look_at(ScreenPointToRay(), Vector3.UP)
	move_and_slide(Vector3(vector.x * 10 , -(delta * gravity), vector.y * 10) )
	pass

func ScreenPointToRay():
	var spaceState = get_world().direct_space_state
	
	var mousePos = get_viewport().get_mouse_position()
	var camera = get_tree().root.get_camera()
	var rayOrigin = camera.project_ray_origin(mousePos)
	var rayEnd = rayOrigin + camera.project_ray_normal(mousePos) * 2000
	var rayArray = spaceState.intersect_ray(rayOrigin, rayEnd)
	if rayArray.has("position"):
		return rayArray["position"]
	return Vector3()
