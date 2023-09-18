extends CharacterBody2D
class_name Bullet
@export var SPEED = 1000 

var dir = null

func _ready(): 
	set_as_top_level(true)
	
func set_dir(_dir:Vector2): 
	dir = _dir
func _physics_process(delta):
	velocity = SPEED * dir * delta
	move_and_slide()
