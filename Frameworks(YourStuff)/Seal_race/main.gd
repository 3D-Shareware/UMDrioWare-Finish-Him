extends Node2D
@onready var ribbon_seal: RigidBody2D = $Ribbon_Seal

@onready var start_overlay: CanvasLayer = $StartOverlay
@onready var main: Node2D = $"."
@onready var evil_seal: RigidBody2D = $Evil_seal

func _ready():
	
	
	get_tree().paused = true
	ribbon_seal.won.connect(_on_player_won)
	
	start_overlay.game_start.connect(Game_started)
	evil_seal.lose.connect(_on_player_lost)
	
	
func Game_started():
	get_tree().paused = false
	
func slide_instructions():
	var tween = create_tween()
	
	
	pass	
func _on_player_won():
	start_overlay.show()
	start_overlay.animate_countdown("you won!")
func _on_player_lost():
	start_overlay.show()
	start_overlay.animate_countdown("you lost!")
