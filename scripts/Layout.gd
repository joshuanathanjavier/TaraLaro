extends CanvasLayer

@onready var pause = $Pause/pause
@onready var afloor = $Controls/Floor

@onready var pause_menu = get_node("Pause_menu")
@onready var game_over = get_node("Game Over")

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.hide()
	game_over.hide()

func die():
	get_tree().paused = true
	game_over.show()

func _on_pause_pressed():
	pause.modulate.a = 0.5
	get_tree().paused = true
	pause_menu.show()


func _on_pause_released():
	pause.modulate.a = 1.0
