extends FlowContainer

@export var max_elements = 10;
@export var texture_size = 300;

@onready var sub_view: SubViewportContainer = $"../SubViewportContainer"

func _ready():
	_ready_defer.call_deferred();

func _ready_defer():
	var files = DirAccess.get_files_at("E:/Private projects/Development - GoDot/DATA/glb")
	var regex = RegEx.new()
	regex.compile("^.+\\.glb(?!\\.import)$")
	
	for e in files:
		print(e)
		if !regex.search(e):
			continue;
		var rect: TextureRect = TextureRect.new();
		rect.size = Vector2(texture_size, texture_size);
		
		var gltf_doc_load = GLTFDocument.new();
		var gltf_state_load = GLTFState.new();
		var error = gltf_doc_load.append_from_file("E:/Private projects/Development - GoDot/DATA/glb/" + e, gltf_state_load);
		if error == OK:
			var gltf = gltf_doc_load.generate_scene(gltf_state_load);
			sub_view.viewport.add_child(gltf)
			rect.texture = await sub_view.get_render("E:/Private projects/Development - GoDot/DATA/img/" + e + ".png")
			sub_view.viewport.remove_child(gltf)
		add_child(rect)
