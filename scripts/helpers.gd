class_name Helpers
extends Node

static func get_meshes(root: Node) -> Array[MeshInstance3D]:
	var meshes: Array[MeshInstance3D] = []
	for node in root.get_children(true):
		if node is MeshInstance3D:
			meshes.append(node);
		for child in node.get_children(true):
			meshes.append_array(get_meshes(child))
	return meshes;
	
static func get_aabb(arr: Array[MeshInstance3D]) -> AABB:
	var aabb: AABB = arr[0].get_aabb();
	for mesh in arr:
		aabb.merge(mesh.get_aabb());
	return aabb;
