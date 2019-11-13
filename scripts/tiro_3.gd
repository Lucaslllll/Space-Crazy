extends "res://scripts/tiro.gd"

var rotacao = -50

func _ready():
	set_process(true)
	get_node("laser").play()
	dano = 0.5
	pass
func _process(delta):
#rotate(rotacao * delta)
#colocar o mesmo nome do metodo na hora 
#de conectar ao extendido
	pass

