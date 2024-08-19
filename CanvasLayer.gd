extends CanvasLayer

onready var score = $Label

func _ready() -> void:
	Stats.connect("score_updated", self, "update_interface")
	Stats.connect("player_died", self, "_PlayerData_player_died")
	update_interface()
	
func update_interface():
	score.text = "Score: %s" % Stats.score
