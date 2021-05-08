extends Area2D

signal enemy_killed

func _on_top_checker_enemy_killed():
	emit_signal("enemy_killed")
	queue_free()
