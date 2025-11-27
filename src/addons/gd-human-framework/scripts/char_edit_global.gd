@tool
extends Node

var meshs_shapes
var clothes_button: Button
var cloth_array: Dictionary[String, String] = {
	"eyes": "bodyparts",
	"male_jeans_01": "clothes",
	"male_shirt_01": "clothes",
	"dress_mini_03": "clothes"
}

func _ready():
	var file = FileAccess.open_compressed("res://addons/gd-human-framework/shapes.dat",FileAccess.READ)
	meshs_shapes = file.get_var()
	file.close()
