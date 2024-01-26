extends GridContainer

@export var elements = 250;
var viewport_scene:PackedScene = preload("res://scenes/viewport_control.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in elements:
		var vp: SubViewportContainer = viewport_scene.instantiate();
		print(get_viewport_rect().size.x)
		columns = get_viewport_rect().size.x / vp.viewport_size.x;
		add_child(vp)
