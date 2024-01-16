extends CharacterBody2D

@export var speed = 1000
@export var bullet_scene : PackedScene

func shoot():
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.transform = $Muzzle.global_transform

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	var dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = dir * speed
	move_and_slide()

func _process(_delta):
	var mouse_pos = get_global_mouse_position()

	look_at(mouse_pos)
	$Crosshairs.set_global_position(mouse_pos)
