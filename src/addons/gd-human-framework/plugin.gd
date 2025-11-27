@tool
extends EditorPlugin

var generator: HumanImporter

func _enter_tree() -> void:
	add_tool_menu_item("Import meshes to the library", import_meshes)


func _exit_tree() -> void:
	remove_tool_menu_item("Import meshes to the library")

func import_meshes():
	if get_node_or_null("generate") == null:
		generator = load("res://addons/gd-human-framework/imported_mesh/generate.tscn").instantiate()
		add_child(generator)
	generator.import_meshes()
