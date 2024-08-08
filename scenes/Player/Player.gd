extends CharacterBody2D

var speed: float

func  _ready():
	$AnimatedSprite2D.play("idle")

func  _physics_process(_delta):
	move_and_slide()
