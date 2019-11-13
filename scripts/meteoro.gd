extends "res://scripts/classes/inimigo/classe_inimigo.gd"

var velocidade = 150
var rotacao = 0



func _ready():
	add_to_group(game.GRUPO_INIMIGO)
	randomize()
	

func _inicia():	
	rotacao = rand_range(-3, 3)
	
func _destroi():
	get_node("explosao").play()
	get_node("anima").play("destroy")
	
func _process(delta):
	set_position(get_position() + Vector2(0, 1) * velocidade * delta)
	rotate(rotacao * delta)
	
	if get_position().y > 750.061:
		#print("tchau meteoro")
		queue_free()

#é necessario conectar os cada copia a esse metodo
func _on_meteoro_area_entered(area):
	if area.is_in_group(game.NAVE):
		if area.has_method("dano_recebido"):
			area.dano_recebido(1)
			
		_destroi()
		
