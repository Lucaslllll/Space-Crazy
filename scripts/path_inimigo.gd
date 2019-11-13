extends Path2D

onready var follow = get_node("follow")

var velocidade = rand_range(150, 300)



func _ready():
	set_curve(recursos.random_path())
	set_process(true)
	get_node("follow/inimigo").connect("destruiu", self, "_on_destruiu")
	
	
func _process(delta):
	follow.set_offset(follow.get_offset() + velocidade * delta)
	
	if follow.get_unit_offset() > 1:
		queue_free()
		
func _on_destruiu():
	set_process(false)
	#por que o follow não será mais processado
	#então poderá ser destruido com o queue_free()
	var timer = Timer.new()
	timer.set_wait_time(1)
	timer.connect("timeout", self, "destroi")
	timer.start()
	add_child(timer)
	
func destroi():
	#sempre bom usar o breakpoint para ver se algo esta sendo executado
	queue_free()
	