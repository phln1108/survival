extends Area2D
class_name HitboxComponent

signal punch

@export var damage : float = 5

var collisionActive: bool = true : 
	set(state):
		collisionActive = state
		for child: Node in get_children():
			if child is CollisionShape2D or child is CollisionPolygon2D:
				child.disabled = true

func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent and get_parent() != null and area.owner != get_parent():
		var newAttack := Attack.new()
		newAttack.attack_damage = damage
		area.damage(newAttack)
		punch.emit()
		

	
	
