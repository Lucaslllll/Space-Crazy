

var pre_tiro = preload("res://scenes/tiro.tscn")
var intervalo = .25
var ultimodisparo = 0
var nave

#nave é o parametro que recebe o script nave
#e passa para 'var nave'

	

func _init(nave):
	self.nave = nave

func disparar():
	if ultimodisparo <= 0:
		cria_tiro(nave.get_node("PosE"))
		cria_tiro(nave.get_node("PosD"))
		ultimodisparo = intervalo
	
func atualiza(delta):
	if ultimodisparo > 0:
		ultimodisparo -= delta
		
func cria_tiro(node):
	var tiro = pre_tiro.instance()
	tiro.set_global_position(node.get_global_position())
	nave.get_owner().add_child(tiro)