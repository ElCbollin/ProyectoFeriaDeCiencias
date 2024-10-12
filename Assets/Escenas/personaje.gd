extends Area2D
var Proyectil = preload("res://Escenas/proyectil.tscn")

var ScreenSize 

var Recarga:bool = true

@export var Speed = 300  # Aumenté la velocidad para mayor fluidez en el movimiento.

func _ready() -> void:
	ScreenSize = get_viewport_rect().size
	$Timer.start()
	var TablaDeSumas = []

func _process(delta: float) -> void:
	
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1

	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1

	if Input.is_action_just_pressed("Disparar"):
		Disparar()

	# Si hay movimiento, normaliza y multiplica por Speed y delta
	if velocity.length() > 0:
		velocity = velocity.normalized() * Speed * delta

	# Actualiza la posición del objeto y restringe dentro de la pantalla
	position += velocity
	position = position.clamp(Vector2(-370,-370),ScreenSize/4)

func Disparar():
	
	if Recarga == true:
		var instanceproyectile = Proyectil.instantiate()
		get_parent().add_child(instanceproyectile)
		instanceproyectile.global_position = $PuntoDeDisparo.global_position
		Recarga = false
 		
func _on_timer_timeout() -> void:
	Recarga = true
	
	
	
