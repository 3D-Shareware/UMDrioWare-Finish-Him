extends Game

@onready var high_score: RichTextLabel = $HighScore

func _start_game():
	high_score.text = 'Highscore ' + str(Director.highscore)

func start_game(game : PackedScene = null):
	var GameManage : GameManager = get_tree().get_first_node_in_group('GameManager')
	GameManage.start_games(game)
