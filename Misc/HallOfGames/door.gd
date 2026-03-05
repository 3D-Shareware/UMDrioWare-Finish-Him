extends Node2D

@export var game_to_switch : PackedScene = null
@onready var area_2d : Area2D = $Area2D

var hall_of_games 
func _ready() -> void:
	hall_of_games = get_tree().get_first_node_in_group('HallOfGames')

func _process(_delta: float) -> void:
	for i in area_2d.get_overlapping_bodies():
		if i!= null:
			if i.is_in_group('presser') and Input.is_action_just_pressed('space'):
				hall_of_games.start_game(game_to_switch)
