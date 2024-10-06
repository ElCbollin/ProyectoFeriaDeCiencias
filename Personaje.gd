extends Area2D
@export var Speed = 300

var Screensize

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Screensize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		print("1")
		velocity.x += 1
		
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		
	# Normalize the velocity and apply speed if there's movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * Speed * delta
	
	# Update the position
	position += velocity
	
	print(Screensize)
	
	# Clamp the position within the screen bounds
	position = position.clamp(Vector2(-150, -150), Vector2(200, 400))
