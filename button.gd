extends Button

var SizeScreen 

var Ship = preload("res://Personaje.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SizeScreen = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.button_down.connect(Iniciar)
	

	if self.global_position.y >= SizeScreen.y:
		$"../Timer".stop()

func Iniciar():
	
	var ShipInstantiate = Ship.instantiate()
	
	get_parent().add_child(ShipInstantiate)
		
	ShipInstantiate.global_position = $"../Spawner".global_position
	
	$"../Timer".start()
	
	
func _on_timer_timeout() -> void:
	self.global_position.y += 20
	
	
