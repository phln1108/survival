extends State
class_name WalkingAround

@export var character: CharacterBody2D

var move_direction: Vector2
var wander_time: float

func randomize_wander() -> void:
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)

func enter() -> void:
	randomize_wander()

func update(delta: float) -> void:
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func physics_update(delta: float) -> void:
	if character:
		character.velocity = move_direction * 10
