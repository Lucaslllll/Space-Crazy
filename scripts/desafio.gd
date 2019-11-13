extends CanvasLayer

func _ready():
	game.connect("morreu_chefao", self, "fim_de_jogo")
	

func fim_de_jogo():
	game.setScoreReset()
	game.setVidaReset()
	get_tree().change_scene("res://scenes/menu.tscn")	
