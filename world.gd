extends Node3D

@onready var label = $Finish/Interact/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	#Allows cursor to be hidden unless game is paused
	if Input.is_action_just_pressed('pause'):
		get_tree().paused = not get_tree().paused
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		$PauseMenu.visible = not $PauseMenu.visible

func interactable():
	#Determines which interactable raycast is looking at
	if  $player/Head/Camera3D/RayCast3D.get_collider() == $Path_1/Lane_1:
		return("Path.1")
	elif $player/Head/Camera3D/RayCast3D.get_collider() == $Path_2/Lane_2:
		return("Path.2")
	


func _physics_process(delta):
	#Pulls the Path the ray is detecting and then on interaction, plays animation
	var interact = interactable()
	if $player/Head/Camera3D/RayCast3D.is_colliding() and Input.is_action_just_pressed("interact"):
		$AnimationPlayer.play(interact)
	
		
func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_screen.tscn")
	


func _on_play_pressed():
	pass # Replace with function body.
