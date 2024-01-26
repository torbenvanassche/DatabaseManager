extends GridContainer

@export var elements = 10;
@export var texture_size = 100;

@onready var sub_view: SubViewportContainer = $"../SubViewportContainer"

func _ready():
	_ready_defer.call_deferred();

func _ready_defer():
	for x in elements:
		var texture: TextureRect = TextureRect.new();
		texture.size = Vector2(texture_size, texture_size);
		
		await RenderingServer.frame_post_draw
		var image = sub_view.viewport.get_texture().get_image().save_png("res://test.png")
		texture.texture = load("res://test.png")
		columns = get_viewport_rect().size.x / texture_size;
		add_child(texture)
