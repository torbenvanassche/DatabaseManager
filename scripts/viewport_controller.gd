extends SubViewportContainer

@onready var camera: ViewportCamera = $SubViewport/CameraRoot;
@onready var viewport: SubViewport = $SubViewport

func _ready():
	gui_input.connect(camera.move_mouse)
	
func get_render(path: String):
	await RenderingServer.frame_post_draw
	var image = viewport.get_texture().get_image().save_png(path)
	var img = Image.load_from_file(path)
	return ImageTexture.create_from_image(img);
