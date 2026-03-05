extends Camera2D

@onready var prooble_1: CharacterBody2D = $"../Prooble 1"


func _process(delta: float) -> void:
	global_position.x = prooble_1.global_position.x
