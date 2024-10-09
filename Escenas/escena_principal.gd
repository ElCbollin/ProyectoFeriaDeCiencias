extends Node2D
var SizeScreen 

var EstadoDelJuego:bool = false
@onready var Root = get_node("/root/Node2D")


var Ship = preload("res://Escenas/Personaje.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SizeScreen = get_viewport_rect().size
	$Control/Button.button_down.connect(Iniciar)
	print(Root)


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

	
	$Timer.start()
func _on_timer_timeout() -> void:
	$Control/Button.global_position.y += 20


func _on_timer_2_timeout() -> void:
	for v in Root.get_children():
		if v.name == "Area2D":
			if v.position.y >= -350:
				v.position.y -= 25

	

	
