extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node(".").visible && Input.is_action_pressed('interact'):
			get_tree().change_scene_to_file("res://End Scene/end_scene.tscn")
			
