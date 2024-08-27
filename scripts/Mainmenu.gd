extends Control

class_name Mainmenu

@onready var play = $MarginContainer/HBoxContainer/VBoxContainer/play2
@onready var exit = $MarginContainer/HBoxContainer/VBoxContainer/exit2
@onready var main = load("res://scenes/Main.tscn") as PackedScene


func _on_play_2_pressed():
	play.modulate.a = 0.5
	get_tree().change_scene_to_packed(main)

func _on_play_2_released():
	play.modulate.a = 1.0

func _on_exit_2_pressed():
	exit.modulate.a = 0.5
	get_tree().quit()

func _on_exit_2_released():
	exit.modulate.a = 1.0
