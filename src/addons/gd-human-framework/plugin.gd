@tool
extends EditorPlugin

var generator: HumanImporter
var clothes_editor: Button

func _enter_tree() -> void:
	# add_autoload_singleton("char_edit_global", "res://addons/gd-human-framework/scripts/char_edit_global.gd")
	clothes_editor = add_control_to_bottom_panel(load("res://addons/gd-human-framework/scripts/editor/char_edit_editor.tscn").instantiate(), "Change morphs/clothes")
	CharEditGlobal.clothes_button = clothes_editor
	clothes_editor.hide()
	add_tool_menu_item("Import meshes to the library", import_meshes)


func _exit_tree() -> void:
	remove_tool_menu_item("Import meshes to the library")
	clothes_editor.hide()
	CharEditGlobal.clothes_button = null
	remove_control_from_bottom_panel(clothes_editor)
	# remove_autoload_singleton("char_edit_global")


func import_meshes():
	if get_node_or_null("generate") == null:
		generator = load("res://addons/gd-human-framework/imported_mesh/generate.tscn").instantiate()
		add_child(generator)
	generator.import_meshes()
