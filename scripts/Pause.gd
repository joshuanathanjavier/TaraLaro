extends Control
class_name Paused

@onready var pause = $pause

func _on_pause_pressed():
	pause.modulate.a = 0.5


func _on_pause_released():
	pause.modulate.a = 1.0
