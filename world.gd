extends Node3D

@onready var label = $Finish/Interact/Label
# Called when the node enters the scene tree for the first time.


func _process(delta):
	if Input.is_action_just_pressed('pause'):
		get_tree().paused = not get_tree().paused
		$PauseMenu.visible = not $PauseMenu.visible

		
func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_screen.tscn")
	





