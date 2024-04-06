extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 150
	move_and_slide()


func take_damage():
	health -= 1
	$AnimatedSprite2D.play("hurt")
	if health == 0:
		queue_free()
