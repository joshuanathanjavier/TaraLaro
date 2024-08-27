extends CharacterBody2D

@onready var detect = $"../Layout"
var speed := 150
const gravity = 300
var direction = Vector2.ZERO

func _init():
	set_as_top_level(true)

func _ready():
	velocity = speed * direction

func _process(_delta):
	var overlapping_objects = $BumpArea.get_overlapping_areas()
	
	for area in overlapping_objects:
		var parent = area.get_parent()
		print(parent.name)
		if area.get_parent().is_in_group("Player"):
			Global.score += 1
		elif area.get_parent().is_in_group("Floor"):
			detect.die()

func _physics_process(delta: float) -> void:
	
	velocity.y += gravity * delta
	rotation += 3 * delta
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
