extends ProgressBar

#
#func _ready():
	#change_health(100)

func change_health(new_health: float) -> void:
	var tween = create_tween()
	tween.tween_property(self,"value",new_health, 0.4)
	if new_health == max_value:
		await tween.finished
	visible = not new_health == max_value
