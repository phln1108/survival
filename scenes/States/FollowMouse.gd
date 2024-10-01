extends State
class_name FollowMouse

@export var character : CharacterBody2D
@export var moveSpeed := 40

@export var perceptionArea: Area2D
@export var stateMachine: StateMachine 

@export var statesToEnter: Array[String]


func init() -> void:
	perceptionArea.mouse_entered.connect(on_mouse_enter)
	perceptionArea.mouse_exited.connect(on_mouse_exit)

func enter() -> void:
	character.velocity = Vector2.ZERO

func physics_update(delta: float) -> void:
	var direction := character.get_global_mouse_position() - character.global_position
	#print(direction.length())
	
	if direction.length() > 5:
		character.velocity = direction.normalized() * moveSpeed
	else:
		character.velocity = Vector2.ZERO
		

func on_mouse_enter() -> void:
	if stateMachine.currentState.name in statesToEnter:
		stateMachine.force_change_state(self.name)
	
func on_mouse_exit() -> void:
	if stateMachine.currentState.name == self.name:
		stateMachine.force_change_state("idle")
		
	
