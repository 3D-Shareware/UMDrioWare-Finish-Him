extends RigidBody2D

var glumph_speed : int = 5
var timer : int = 1
var was_on_ground := false
@onready var ground: StaticBody2D = $"../Ground"
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ribbon_seal: RigidBody2D = $"."
@onready var ocean: Area2D = $"../Ocean"
@onready var evil_seal: Sprite2D = $Evil_Seal
@onready var Evil_seal: RigidBody2D = $"."
var has_lost := false

signal lose 

func _ready():
	ocean.body_entered.connect(_on_area_entered)
func _process(delta):
	
	var on_ground = ray_cast_2d.is_colliding()
	
	if not was_on_ground and on_ground:
		land_stretch(delta)
		
	was_on_ground = on_ground
	
	glumph()
	
	
	evil_seal.scale.x = move_toward(evil_seal.scale.x, 1, .4 * delta)
	evil_seal.scale.y = move_toward(evil_seal.scale.y, 1, .4 * delta)
	
	
	
func land_stretch(delta):
	var tween = create_tween()
	tween.tween_property(evil_seal, "scale", Vector2(1.4, .8), .05)
	
	
func glumph():
	
	if ray_cast_2d.is_colliding():
		apply_central_impulse(Vector2(50,-100))
		var tween = create_tween()
		tween.tween_property(evil_seal, "scale", Vector2(.8, 1.4), .05)
		
	
	
func _on_area_entered(body):
	print ("unslap bellay")
	if body == self and not has_lost:
		has_lost = true
		emit_signal("lose")
	
