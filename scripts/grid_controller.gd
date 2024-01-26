extends FlowContainer

@export var max_elements = 10;
@export var texture_size = 300;

@onready var sub_view: SubViewportContainer = $"../SubViewportContainer"

func _ready():
	_ready_defer.call_deferred();

func _ready_defer():
	var files = DirAccess.get_files_at("res://data_test")
	var regex = RegEx.new()
	regex.compile("^.+\\.glb(?!\\.import)$")
	
	for e in files:
		if !regex.search(e):
			continue;
		var rect: TextureRect = TextureRect.new();
		rect.size = Vector2(texture_size, texture_size);
		rect.texture = await sub_view.get_render("res://data_images/" + e + ".png")
		add_child(rect)
