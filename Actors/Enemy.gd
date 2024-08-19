extends KinematicBody2D

var motion = Vector2()
var target = null

onready var animate = $AnimationPlayer

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	var Player = get_parent().get_node("Player")
	
	position += (Player.position - position)/100
	look_at(Player.position)
	
# warning-ignore:return_value_discarded
	move_and_collide(motion)


func _on_Area2D_body_entered(body: Node) -> void:
	if "Bullet" in body.name:
		Stats.score += 100
		$Sprite.hide()
		$Splat.show()
		$Splat.play("Splat")

func _on_Splat_animation_finished() -> void:
	queue_free()
