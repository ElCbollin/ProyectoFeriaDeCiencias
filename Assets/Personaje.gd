extends Area2D
@export var Speed = 300

var Screensize

var Proyectil = preload("res://Escenas/proyectil.tscn")



func _ready() -> void:
	Screensize = get_viewport_rect().size
	var TablaDeSumas = []

func _process(delta: float) -> void:
	
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		
		velocity.x += 1
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		
		
	if Input.is_action_just_pressed("Disparar"):
		Disparar(null)
		
		

	if velocity.length() > 0:
		velocity = velocity.normalized() * Speed * delta
	

	position += velocity

	position = position.clamp(Vector2(-150, -150), Vector2(200, 400))
	
	
	
func Disparar(Parametter):
	var InstanceProyectile = Proyectil.instantiate()
	get_parent().add_child(InstanceProyectile)
	
	InstanceProyectile.global_position = $PuntoDeDisparo.global_position
		

	
	
