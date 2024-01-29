extends SubViewportContainer

@onready var controlled_camera: ViewportCamera = $SubViewport/CameraRoot;
@onready var viewport: SubViewport = $SubViewport;
@onready var snap_camera: Camera3D = $SubViewport/SnapshotCamera;

func _ready():
	gui_input.connect(controlled_camera.move_mouse)
	
func get_render(path: String, aabb: AABB):
	snap_camera.position = aabb.get_endpoint(0) * 1.5;
	snap_camera.look_at(aabb.get_center());
	
	for iteration in 5:
		for index in 8:
			var v3: Vector3 = aabb.get_endpoint(index);
			if !snap_camera.is_position_in_frustum(v3):
				snap_camera.position -= aabb.get_endpoint(0) / 2;
	
	
	await RenderingServer.frame_post_draw
	viewport.get_texture().get_image().save_png(path)
	var img = Image.load_from_file(path)
	return ImageTexture.create_from_image(img);
