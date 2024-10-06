extends Area2D

@export var Vel:int = 20


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var velocity = Vector2.ZERO



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	self.position.y -= Vel
	
	
