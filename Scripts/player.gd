extends CharacterBody2D

signal health_deplated

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = (direction * 300)
	
	if velocity.length() > 0.0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	
	const DAMAGE_RATE = 5.0
	var ovelapping_mobs = %HurtBox.get_overlapping_bodies()
	
	if ovelapping_mobs.size() > 0:
		health -= DAMAGE_RATE * ovelapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_deplated.emit()
		
	move_and_slide()
