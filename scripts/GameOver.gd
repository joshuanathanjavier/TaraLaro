extends Control

@onready var mainmenu = preload("res://scenes/Mainmenu.tscn") as PackedScene

var _is_paused:bool = false:
	set = set_paused

func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_restart_pressed() -> void:
	_is_paused = false
	Global.score = 0
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	#get_tree().quit()
	_is_paused = false
	get_tree().change_scene_to_file("res://scenes/Mainmenu.tscn")
