extends Area2D

@export var Vel:int = 20

@onready var Root = get_node("/root/Node2D")

var i:int 

func _ready() -> void:
	var TablaDeSumas = []
	var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	
	self.position.y -= Vel
	
func _on_body_entered(body: Node2D) -> void:

		if Root.find_child("Control").find_child("HBoxContainer").find_child("StaticBody2D2").find_child("NumeroActual"):
		
				var i:int
				body.queue_free()
				global.TablaDeSumas.append(str(body.get_groups()[0]))
				
				for v in Root.get_children():
					if v.is_in_group("Solucion"):
						global.Solucion = str(v.get_groups()[0])
						
				for v in global.TablaDeSumas:
					i += int(v)
	
					Root.find_child("Control").find_child("HBoxContainer").find_child("StaticBody2D2").find_child("NumeroActual").text = str(i)
			
					if str(i) == str(global.Solucion):
						print("sucess")		
					if int(i) > int(global.Solucion):
						print("no")
						
						
	
					
					
					
	
					
			
					
					
				
			
		
	
		
			
			

		
		
				
			
			
				
	

		
