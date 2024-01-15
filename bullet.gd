extends Area2D

@export var speed = 600

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
	queue_free()
	
func _on_screen_exited():
	queue_free()
