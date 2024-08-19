extends KinematicBody2D

export var movementspeed = 600

onready var bullet = preload("res://Actors/Bullet.tscn")

func _ready() -> void:
	pass # Replace with function body.

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	var motion = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	
	if Input.is_action_just_pressed("LMB"):
		fire()
	
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movementspeed)
	
	look_at(get_global_mouse_position())
	
func fire():
	var scene = get_tree().current_scene
	var instance = bullet.instance()
	scene.add_child(instance)
	instance.transform = $muzzle/muzzlepoint.global_transform

func kill():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func _on_Area2D_body_entered(body: Node) -> void:
	if "Enemy" in body.name:
		Stats.score = 0
		kill()
