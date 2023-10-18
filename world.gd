extends Node3D

@onready var label = $Finish/Interact/Label
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	if Input.is_action_just_pressed('pause'):
		get_tree().paused = not get_tree().paused
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		$PauseMenu.visible = not $PauseMenu.visible

		
func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_screen.tscn")
	







func _on_play_pressed():
	pass # Replace with function body.
