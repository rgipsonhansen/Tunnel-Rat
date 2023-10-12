extends CharacterBody3D

@onready var head = $Head


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENS = 0.15
@export var turn_speed = 0.025
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#Current pause screen doesn't work with mouse movement
#func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	



#mouse movement on the x,y axis
#func _input(event):
	#if event is InputEventMouseMotion:
		#rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		#head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		#head.rotation.x = clamp(head.rotation.x,deg_to_rad(-89.0),deg_to_rad(89.0))
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
#Tank control movement
	if Input.is_action_pressed('rotateLeft'):
		rotation.y +=  .05
	elif Input.is_action_pressed('rotateRight'):
		rotation.y -= .05
		

	move_and_slide()
