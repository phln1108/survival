extends Area2D
class_name HurtboxComponent

@export var health_component: HealthComponent

func damage(attack: Attack) -> void:
	if health_component:
		health_component.damage(attack)

 
