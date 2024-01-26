extends SubViewportContainer

@onready var camera: ViewportCamera = $SubViewport/CameraRoot;
@onready var viewport: SubViewport = $SubViewport

func _ready():
	gui_input.connect(camera.move_mouse)
