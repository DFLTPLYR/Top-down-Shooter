extends RigidBody2D

onready var bulletTimer = $Timer
export var bulletspeed = 10000

func _ready() -> void:
	bulletTimer.start()

func _physics_process(delta: float) -> void:
	position += transform.x * bulletspeed * delta

func kill():
	queue_free()
	
func _on_Area2D_area_entered(area: Area2D) -> void:
	kill()

func _on_Timer_timeout() -> void:
	kill()
