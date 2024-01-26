class_name ViewportCamera
extends Node3D

@export var target: Node3D

@export var distance: float = 10
@export var max_distance: float = 20
@export var min_distance: float = 8

var pitch_input: float = 0
var twist_input: float = 0

var mouse_position:Vector2
var mouse_down = false;

func _ready():
	%Camera3D.position.z = distance
	
func _process(_delta):
	$TwistPivot.rotate_y(twist_input)
	$TwistPivot/PitchPivot.rotate_x((pitch_input))
	$TwistPivot/PitchPivot.rotation.x = clamp($TwistPivot/PitchPivot.rotation.x, -0.7, -0.15)
	
	twist_input = 0.0
	pitch_input = 0.0
	
func move_mouse(event):	
	if event is InputEventMouseMotion && event.button_mask == 1:
		twist_input = - event.relative.x * 0.01;
		pitch_input = - event.relative.y * 0.01;
