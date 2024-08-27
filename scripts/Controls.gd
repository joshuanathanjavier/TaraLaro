extends Control

@onready var left = $left
@onready var right = $right
@onready var dash = $dash
@onready var jump = $jump

func _on_left_pressed():
	left.modulate.a = 0.5


func _on_left_released():
	left.modulate.a = 1.0


func _on_right_pressed():
	right.modulate.a = 0.5


func _on_right_released():
	right.modulate.a = 1.0


func _on_attack_pressed():
	dash.modulate.a = 0.5


func _on_attack_released():
	dash.modulate.a = 1.0


func _on_jump_pressed():
	jump.modulate.a = 0.5


func _on_jump_released():
	jump.modulate.a = 1.0
