extends Area2D

@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	print("you died") # +++ with function $AnimatedSprite2Dbody.
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	

func _on_timer_timeout():
	Engine.time_scale=1
	get_tree().reload_current_scene()
