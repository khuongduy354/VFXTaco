extends CharacterBody2D

# states 
enum { 
	MOVE, IDLE
}
var state = IDLE

#childs 
@onready var anim_p = $AnimationPlayer
@onready var GunComp =$flip_pivot/GunComp
#stats 
@export var MAX_SPEED = 5000
@export var JUMP_FORCE = 20000

func get_input(): 
	var input = Vector2.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
#	input.y = Input.get_axis("ui_up", "ui_down")
	return input
func _ready():
	GunComp.wield_gun(Global.gun_type.MINIGUN)
func _physics_process(delta):

	var input = get_input()

	match state:
		MOVE: _move(input, delta)
		IDLE: _idle(input, delta)
	move_and_slide()

func _idle(input,delta): 
	apply_gravity(delta)
	
	if input.x != 0: 
		state = MOVE

	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		velocity.y = -JUMP_FORCE*delta
		anim_p.play("jump")
	elif is_on_floor(): 
		anim_p.play("idle")
	if Input.is_action_pressed("shoot"): 
		GunComp.shoot()

	velocity.x=0
	

func flip(input): 
	if input.x>0: 
		$flip_pivot.scale.x=1
	elif input.x <0:
		$flip_pivot.scale.x=-1

func _move(input,delta): 
	apply_gravity(delta)
	if input.x == 0: 
		state = IDLE
	flip(input)

	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		velocity.y = -JUMP_FORCE*delta 
		anim_p.play("jump")
	elif is_on_floor(): 
		anim_p.play("run")
	if Input.is_action_pressed("shoot"): 
		GunComp.shoot()
	velocity.x=input.x * MAX_SPEED *delta

func apply_gravity(delta):
	velocity.y += Global.GRAVITY * delta
	velocity.y = min(velocity.y, 300)
