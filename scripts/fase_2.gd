extends CanvasLayer


func _ready():
	game.connect("morreu_chefao", self, "passar_fase")
	pass
	
func passar_fase():
	game.setScoreReset()
	game.setVidaReset()
	get_tree().change_scene("res://scenes/fase_partes/fase3_aviso.tscn")
