extends Area2D

var ativado = false

func _ready():
	ativa(10)



func _on_escudo_area_entered(area):
	if ativado and area.is_in_group(game.INIMIGO):
		area.dano_recebido(100)
		get_owner().get_owner().shake(0.5)
	elif ativado and area.is_in_group(game.TIRO_INIMIGO):
		area.queue_free()
	elif ativado and area.is_in_group(game.CHEFE):
		get_owner().get_owner().shake(1)
	elif ativado and area.is_in_group(game.GRUPO_INIMIGO):
		get_owner().get_owner().shake(0.2)
		area.dano_recebido(100)
		
func ativa(segs):
	ativado = true
	set_visible(true)
	get_node("Timer").set_wait_time(segs)
	get_node("Timer").start()
	
#quando acabar o tempo...
func _on_Timer_timeout():
	ativado = false
	set_visible(false)
