extends Control
class_name HealthComponent

signal die
signal hurt

@onready var healthBar := $HealthBar

@export var MAX_HEALTH: float = 100

var health: float:
	set(value):
		health = value
		healthBar.change_health(value)

func _ready() -> void:
	healthBar.max_value = MAX_HEALTH
	healthBar.min_value = 0
	healthBar.visible = false
	health = MAX_HEALTH

	
func damage(attack: Attack) -> void:
	health = clamp(health + attack.attack_damage, 0, MAX_HEALTH)
	if health == 0:
		die.emit()
	hurt.emit()
	
func heal(value: float) -> void:
	health = clamp(health + value, 0, MAX_HEALTH)
