extends Node2D
var SizeScreen 
var Numeros= preload("res://Escenas/Numbers.tscn")

var Operaciones = {1 :{"Pregunta" : "5+2(4-2)",
						  "Respuesta": "9",
						 "Opciones": ["7","9","8","6"],},
						   
					2: {"Pregunta" : "5(1+5)/2",
						 "Respuesta": "15",
						"Opciones":["15","7","11","14"]},
					 3: {"Pregunta" : "2(5-2)",
						  "Respuesta": "6",
							"Opciones":["1","5","4","6"]}}

var EstadoDelJuego:bool = false
var OperacionActiva:bool = false
@onready var Root = get_node("/root/Node2D")


var Ship = preload("res://Escenas/Personaje.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SizeScreen = get_viewport_rect().size
	$Control/Button.button_down.connect(Iniciar)
	
	

	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $Control/Button.global_position.y >= SizeScreen.y:
		if EstadoDelJuego == false:
			EstadoDelJuego = true
			$Timer.stop()
			var ShipInstance = Ship.instantiate()
			Root.add_child(ShipInstance)
			ShipInstance.add_child($Marker2D)
			$Timer2.start() 
			ShipInstance.position = $Marker2D.position
func Iniciar():
	
	InicioDeJuego()
	
	

	
	$Timer.start()
func _on_timer_timeout() -> void:
	$Control/Button.global_position.y += 20


func _on_timer_2_timeout() -> void:
	for v in Root.get_children():
		if v.name == "Area2D":
			if v.position.y >= -350:
				v.position.y -= 25

	
func InicioDeJuego():
	
	if OperacionActiva == false:
		OperacionActiva = true
		var RandomNumber = int(randf_range(1,3))
		for i in range(0,4):
			var InstanceNumbers = Numeros.instantiate()
			Root.add_child(InstanceNumbers)
			InstanceNumbers.global_position.x = 200*i
			var PreguntaElegida = Operaciones[RandomNumber]["Pregunta"]	
			$Control/HBoxContainer/OperacionAritmetica.text = str(PreguntaElegida)
		
			InstanceNumbers.find_child("AnimatedSprite2D").play(Operaciones[RandomNumber]["Opciones"][i])
		
		
		
		
		
		

		
		
		
			
	
			

		
			
		

		


		
		


	
	
	
	
