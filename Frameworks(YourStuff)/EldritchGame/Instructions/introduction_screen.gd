class_name EldritchInstructionScreen extends Node2D
@onready var dissapear: Node2DEffect = $Dissapear
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	get_tree().paused = true
	animation_player.play("intro")
	await animation_player.animation_finished
	do_introduction()



func do_introduction() -> void:
	dissapear.do_tween()
	await dissapear.tween.finished
	get_tree().paused = false
