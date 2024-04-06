extends Node2D

var paused = false

func pause():
	%GameOverScreen/Label.text = "Game on pause"
	%GameOverScreen.visible = true
	Engine.time_scale = 0
	
func resume():
	%GameOverScreen.visible = false
	Engine.time_scale = 1

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if !paused:
			pause()
		else:
			resume()
		paused = !paused
	

func spawn_mob():
	var mob = preload("res://Scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)

func _on_timer_timeout():
	spawn_mob()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_player_health_deplated():
	%GameOverScreen/Label.text = "Game Over"
	%GameOverScreen.visible = true
