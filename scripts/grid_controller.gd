extends FlowContainer

@export var max_elements = 10;
@export var texture_size = 300;

@onready var sub_view: SubViewportContainer = $"../SubViewportContainer"
@export_global_dir var file_dir: String;

func _ready():
	_ready_defer.call_deferred();

func _ready_defer():
	var files = DirAccess.get_files_at(file_dir)
	
	for e in files:
		if !e.ends_with(".glb"):
			continue;
		var rect: TextureRect = TextureRect.new();
		rect.size = Vector2(texture_size, texture_size);
		
		var gltf_doc_load = GLTFDocument.new();
		var gltf_state_load = GLTFState.new();
		var error = gltf_doc_load.append_from_file(file_dir + "/" + e, gltf_state_load);
		if error == OK:
			var gltf = gltf_doc_load.generate_scene(gltf_state_load);
			sub_view.viewport.add_child(gltf)
			var bbox = Helpers.get_aabb(Helpers.get_meshes(gltf))
			rect.texture = await sub_view.get_render(file_dir + "/" + e + ".png", bbox)
			sub_view.viewport.remove_child(gltf)
		add_child(rect)
