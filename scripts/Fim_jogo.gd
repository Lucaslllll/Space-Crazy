extends CanvasLayer


func _on_Timer_timeout():
	game.setDesafio(true)
	game.salvar_dados()
	get_tree().change_scene("res://scenes/menu.tscn")
