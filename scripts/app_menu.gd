extends Control


@onready var sipa = $CanvasLayer/Sipa
@onready var eme = $CanvasLayer/Eme
@onready var sipa_main = load("res://scenes/Mainmenu.tscn") as PackedScene
@onready var eme_main = load("res://FPP/scenes/3Dworld.tscn") as PackedScene



func _on_sipa_pressed() -> void:
	sipa.modulate.a = 0.5
	get_tree().change_scene_to_packed(sipa_main)
	DisplayServer.screen_set_orientation(DisplayServer.SCREEN_PORTRAIT)


func _on_sipa_released() -> void:
	sipa.modulate.a = 1.0


func _on_eme_pressed() -> void:
	eme.modulate.a = 0.5
	get_tree().change_scene_to_packed(eme_main)
	DisplayServer.screen_set_orientation(DisplayServer.SCREEN_LANDSCAPE)


func _on_eme_released() -> void:
	eme.modulate.a = 1.0
