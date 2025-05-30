extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move left", "move right")
	if !is_on_floor():
		animated_sprite_2d.play("jump")
	else:
		if direction==0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	if direction == -1.0:
		animated_sprite_2d.flip_h = true
	if direction == 1:
		animated_sprite_2d.flip_h=false
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction == 0:
		animated_sprite_2d.play('idle')
	else:
		animated_sprite_2d.play("run")
		
	

	move_and_slide()
