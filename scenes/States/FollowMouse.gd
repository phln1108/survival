extends State
class_name FollowMouse

@export var character: CharacterBody2D
@export var moveSpeed := 40

func enter() -> void:
	character.velocity = Vector2.ZERO

func physics_update(delta: float) -> void:
	var direction := character.get_global_mouse_position() - character.global_position
	#print(direction.length())
	
	if direction.length() > 25:
		character.velocity = direction.normalized() * moveSpeed
	else:
		character.velocity = Vector2.ZERO

