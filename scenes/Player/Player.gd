extends CharacterBody2D

func  _ready():
	$AnimatedSprite2D.play("idle")

func  _physics_process(delta):
	move_and_slide()
