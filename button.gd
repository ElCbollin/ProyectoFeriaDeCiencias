extends Button

var SizeScreen 

var EstadoDelJuego:bool = false

var Ship = preload("res://Escenas/Personaje.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SizeScreen = get_viewport_rect().size
	self.button_down.connect(Iniciar)


	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.global_position.y >= SizeScreen.y:
		if EstadoDelJuego == false:
			EstadoDelJuego = true
			$"../Timer".stop()
			var ShipInstance = Ship.instantiate()
			get_parent().add_child(ShipInstance)
			ShipInstance.global_position = $"../ParallaxBackground/Spawner".global_position
			
func Iniciar():
	
	$"../Timer".start()

	
func _on_timer_timeout() -> void:
	self.global_position.y += 20
	
	
