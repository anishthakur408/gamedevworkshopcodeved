extends CharacterBody2D

const SPEED = 300.0
const ACCELERATION = 1200.0
const DECELERATION = 1500.0
const JUMP_VELOCITY = -500.0

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Left / Right movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		# Smoothly accelerate
		velocity.x = move_toward(
			velocity.x,
			direction * SPEED,
			ACCELERATION * delta
		)
	else:
		# Smoothly slow down
		velocity.x = move_toward(
			velocity.x,
			0,
			DECELERATION * delta
		)

	move_and_slide()
