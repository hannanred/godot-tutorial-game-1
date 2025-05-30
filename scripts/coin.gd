extends Area2D

@onready var game_manager: Node = %GameManager
@onready var pickupsound: AudioStreamPlayer2D = $pickupsound
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	print("+1 coin")
	animation_player.play("pickupanimation")
	game_manager.add_point()
	
	
