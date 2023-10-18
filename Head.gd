extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var yaw = 0
var pitch = 0 

var sens = 0.001

#Moves head with mouse input
func _input(event):
	if event is InputEventMouseMotion and not get_tree().paused:
		yaw += event.relative.x * -sens
		pitch += event.relative.y * -sens
		$Camera3D.transform.basis = Basis()
		transform.basis = Basis()
		rotate_object_local(Vector3(0,1,0), yaw)
		$Camera3D.rotate_object_local(Vector3(1,0,0), pitch)
		$Camera3D.rotation.y = clamp($Camera3D.rotation.y, deg_to_rad(-85), deg_to_rad(85))
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, deg_to_rad(-85), deg_to_rad(85))
