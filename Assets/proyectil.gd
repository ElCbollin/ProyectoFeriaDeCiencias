extends Area2D

@export var Vel:int = 20

@onready var Root = get_node("/root/Node2D")

@onready var Chr = get_node("/root/Node2D/Personaje")

var i:int 

func _ready() -> void:
	var TablaDeSumas = []
	var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	
	self.position.y -= Vel
	
func _on_body_entered(body: Node2D) -> void:
	
	
		if Root.find_child("Control").find_child("HBoxContainer").find_child("StaticBody2D2").find_child("NumeroActual"):
		
				var i:int
				self.queue_free()
	   

				body.queue_free()
				global.TablaDeSumas.append(str(body.get_groups()[0]))
				
				for v in Root.get_children():
					if v.is_in_group("Solucion"):
						global.Solucion = str(v.get_groups()[0])
						
				for v in global.TablaDeSumas:
					i += int(v)
					
					
	
					Root.find_child("Control").find_child("HBoxContainer").find_child("StaticBody2D2").find_child("NumeroActual").text = str(i)
			
					if int(i) == int(global.Solucion):
						global.Partida = true
						global.TablaDeSumas = []
						$Sprite2D.modulate
						i = 0
						print(global.Solucion)
						Root.find_child("Control").find_child("HBoxContainer").find_child("StaticBody2D2").find_child("NumeroActual").text = str(i)
						
						  
						
						for j in Root.get_children():
			
							if j.is_in_group("Numbers"):
								j.queue_free()
						
						
					
					if int(i) > int(global.Solucion):
						print("Error")
					
						i = 0
						global.TablaDeSumas = []
						print(i)
						print(global.Solucion)
						Root.find_child("Control").find_child("HBoxContainer").find_child("StaticBody2D2").find_child("NumeroActual").text = str(i)
						
						if Chr.find_child("AnimatedSprite2D").get_animation() == "100Life" and global.Partida == false:
							Chr.find_child("AnimatedSprite2D").play("75Life")
							global.Partida = true
							
						if Chr.find_child("AnimatedSprite2D").get_animation() == "75Life" and global.Partida == false:
							Chr.find_child("AnimatedSprite2D").play("50Life")
							global.Partida = true
							
						if Chr.find_child("AnimatedSprite2D").get_animation() == "50Life" and global.Partida == false:
							Chr.find_child("AnimatedSprite2D").play("25Life")
							global.Partida = true
							
							
							
							
						for j in Root.get_children():
							
							if j.is_in_group("Numbers"):
								j.queue_free()
								
						
						
						
						
	
					
					
					
	
					
			
					
					
				
			
		
	
		
			
			

		
		
				
			
			
				
	

		
