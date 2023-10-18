extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


var rot_x = 0
var rot_y = 0 

var sens = 0.001

#Moves head with mouse input
func _input(event):
	if event is InputEventMouseMotion and not get_tree().paused:
		rot_x += event.relative.x * -sens
		rot_y += event.relative.y * -sens
		$".".transform.basis = Basis()
		rotate_object_local(Vector3(0,1,0), rot_x)
		rotate_object_local(Vector3(1,0,0), rot_y)
		rotation.y = clamp(rotation.y, deg_to_rad(-85), deg_to_rad(85))
		rotation.x = clamp(rotation.x, deg_to_rad(-85), deg_to_rad(85))
