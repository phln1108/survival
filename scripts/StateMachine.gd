class_name StateMachine
extends Node

@export var initialState: State

var states : Dictionary ={}

var currentState: State = null

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)
	
	if initialState:
		initialState.enter()
		currentState = initialState

func _process(delta: float) -> void:
	if currentState:
		currentState.update(delta)

func _physics_process(delta: float) -> void:
	if currentState:
		currentState.physics_update(delta)

func change_state(sourceState: State, newStateName: String) -> void:
	if sourceState != currentState:
		printerr("invalid change of state!\n Expect: "+ currentState.name +". Got: "+ sourceState.name)
		return
		
	var newState: State = states.get(newStateName.to_lower()) 
	if !newState:
		printerr(newStateName + "not found!")
		return
	
	if currentState:
		currentState.exit()
		
	newState.enter()
	
	currentState = newState

func force_change_state(newStateName: String) -> void:
	var newState: State = states.get(newStateName.to_lower())
	
	if !newState:
		printerr(newStateName + "not found!")
		return
	
	if currentState == newState:
		printerr("State is the same, operation canceled!")
		return
	
	if currentState:
		var exit_callable = Callable(currentState, "exit")
		exit_callable.call_deferred()
	
	newState.enter()
	
	currentState = newState
