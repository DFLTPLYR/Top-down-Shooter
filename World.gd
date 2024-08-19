extends Node2D

var enemy_scene = preload("res://Actors/Enemy.tscn")

const SAFE_RANGE: int = 2000

func _ready() -> void:
	Input.set_custom_mouse_cursor(load("res://Actors/target.png"), Input.CURSOR_ARROW, Vector2(64, 64))


func _on_Spawnrate_timeout() -> void:
	var enemy = enemy_scene.instance()
	enemy.position = $Player.position + Vector2(SAFE_RANGE, 0).rotated(rand_range(0, 2*PI))
	add_child(enemy)
