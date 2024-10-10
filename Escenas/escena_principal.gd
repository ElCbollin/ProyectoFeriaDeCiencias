extends Node2D
var SizeScreen 

var Operaciones = {1 :{"Pregunta" : "5+2(4-2)",
						  "Respuesta": "9",
						 "Opciones": ["7","9","11"],},
						   
					2: {"Pregunta" : "5(1+5)/2",
						 "Respuesta": "15"},
					 3: {"Pregunta" : "-2(5-2)",
						  "Respuesta": "-6"}}

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
		$Control/HBoxContainer/OperacionAritmetica.text = str(Operaciones[RandomNumber]["Pregunta"])
		

		


		
		


	
	
	
	
