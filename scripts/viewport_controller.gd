extends SubViewportContainer

@onready var camera: ViewportCamera = $SubViewport/CameraRoot;
@export var viewport_size = Vector2i(50, 50)

func _ready():
	gui_input.connect(camera.move_mouse)
	($SubViewport as SubViewport).size = viewport_size;
	size = viewport_size;
