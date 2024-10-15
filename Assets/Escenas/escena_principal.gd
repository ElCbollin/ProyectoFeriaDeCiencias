extends Node2D
var SizeScreen 
var Numeros= preload("res://Escenas/NumbersNew.tscn")

var Operaciones = {1 :{"Pregunta" : "5+2(4-2)",
						  "Respuesta": "9",
						 "Opciones": ["5","9","4","6","3","1"],},
						   
					2: {"Pregunta" : "5(1+2)/3",
						 "Respuesta": "5",
						"Opciones":["5","2","3","4","1","6"]},
					 3: {"Pregunta" : "2(5-2)",
						  "Respuesta": "6",
							"Opciones":["1","5","4","6","2","3"]}}

var EstadoDelJuego:bool = false
var OperacionActiva:bool = false
@onready var Root = get_node("/root/Node2D")
@onready var Señal = get_node("/root/Node2D/Proyectil")



var Ship = preload("res://Escenas/Personaje.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SizeScreen = get_viewport_rect().size
	$Control/Button.button_down.connect(Iniciar)
	

	

	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if global.Partida == true:
		OperacionActiva =false
		global.Partida = false
		InicioDeJuego()
	
	
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
		if v.name == "Personaje":
			
			if v.position.y > -350:
				v.position.y -= 90
				$Control/HBoxContainer/TextureRect/PreguntasLabel.position.y -= 200
				$Control/HBoxContainer/TextureRect/StaticBody2D2.position.y += 200
		

				
		
				
				
			
				
		

	
func InicioDeJuego():
	
	if OperacionActiva == false:
		OperacionActiva = true
		var RandomNumber = int(randf_range(1,3))
		for i in range(0,6):
			var InstanceNumbers = Numeros.instantiate()
			Root.add_child(InstanceNumbers)
			InstanceNumbers.global_position.x = 180*i
			if i == 0:
				InstanceNumbers.global_position.x += 20
				
				
			if i == 5:
				InstanceNumbers.global_position.x -= 20
				
			var PreguntaElegida = Operaciones[RandomNumber]["Pregunta"]	
			$Control/HBoxContainer/TextureRect/PreguntasLabel/OperacionAritmetica.text = str(PreguntaElegida)
			InstanceNumbers.find_child("AnimatedSprite2D").play(Operaciones[RandomNumber]["Opciones"][i])
			InstanceNumbers.add_to_group(str(Operaciones[RandomNumber]["Opciones"][i]))
			InstanceNumbers.add_to_group("Numbers")
			
			
			if str(Operaciones[RandomNumber]["Opciones"][i]) == str(Operaciones[RandomNumber]["Respuesta"]):
				InstanceNumbers.add_to_group("Solucion")
				
				
				
				
				
				
				

	
		
	
			
		
		
		
		
		
		
		

		
		
		
			
	
			

		
			
		

		


		
		


	
	
	
	
