extends Label

func _playerhit() -> void:
	Global.score += 1
	text = "Score: %s" % Global.score
