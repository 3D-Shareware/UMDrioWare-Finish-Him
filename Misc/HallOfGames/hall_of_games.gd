extends Game


func _start_game():
	pass

func start_game(game : PackedScene = null):
	var GameManage : GameManager = get_tree().get_first_node_in_group('GameManager')
	GameManage.start_games(game)
