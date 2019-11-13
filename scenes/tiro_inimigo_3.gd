extends Area2D

var velocidade = rand_range(200, 400)
var giro = 1080

func _ready():
	get_node("laser").play()
	add_to_group(game.TIRO_INIMIGO)
	set_process(true)

func _process(delta):
	#rotate(deg2rad(giro) * delta)
	# posso usar translate() em vez de set_position()
	set_position(get_position() + Vector2(0, 1) * velocidade * delta)
	
	pass


func _on_tiro_inimigo_3_area_entered(area):
	pass # Replace with function body.
