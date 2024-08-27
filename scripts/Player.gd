extends CharacterBody2D

class_name Player


@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var score = $"../Layout/ScoreLabel"

@export var speed = 300.0
@export var jump_height = -400.0
@export var dash_speed = 900.0

var dashing = false
var can_dash = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	var direction = Input.get_axis("left", "right")
	if direction:
		if dashing:
			velocity.x = direction * dash_speed
		else:
			velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if direction != 0:
		switch_direction(direction)
	
	score.text = "Score: " + str(Global.score)
	
	update_animations(direction)
	move_and_slide()
	
func update_animations(direction):
			if is_on_floor():
				if direction != 0:
					ap.play("walk")
				else:
					ap.play("idle")
			else:
				if velocity.y < 0:
					ap.play("jump")
				elif velocity.y > 0:
					ap.play("fall")
	
func switch_direction(direction):
	sprite.flip_h = (direction == -1)
	sprite.position.x = direction * 4
	#if Input.is_action_just_pressed("right"):
		#get_node("AttackArea").set_scale(Vector2(1,1))
	#elif Input.is_action_just_pressed("left"):
		#get_node("AttackArea").set_scale(Vector2(-1,1))

func _on_dash_timer_timeout():
	dashing = false

func _on_can_dash_timeout():
	can_dash = true

func _on_dash_pressed():
	dashing = true
	can_dash = false
	$"../dash_timer".start()
	$"../can_dash".start()
