extends CharacterBody2D

@export var proximity = 300
@export var margin = 100
@export var speed = 600

@export var bullet_scene : PackedScene

var mouse_pos

func _init():
	# Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func shoot():
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.transform = $Muzzle.global_transform

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	mouse_pos = get_global_mouse_position()

	var dir = Input.get_axis("move_down", "move_up")
	var dist = position.distance_to(mouse_pos)

	velocity = transform.x * dir * speed

	if Input.is_action_pressed("move_up"):
		velocity *= smoothstep(0, proximity, dist - margin)

	move_and_slide()

func _process(_delta):
	look_at(mouse_pos)
	$Crosshairs.set_global_position(mouse_pos)
