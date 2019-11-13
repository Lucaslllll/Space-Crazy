extends Node2D


var velocidade = 200



func _ready():
	randomize()
	set_process(true)
	pass


func _process(delta):
	set_position(get_position() + Vector2(0, 1) * velocidade * delta)
	
	if get_position().y > 753.615:
		queue_free()
		
	pass
