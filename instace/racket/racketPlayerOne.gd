extends KinematicBody2D

export var speed = 200;

# Called when the node enters the scene tree for the first time.
func _ready():
	Serial.connect("up",self,"_on_up");
	Serial.connect("down",self,"_on_down");
	
func _physics_process(delta):
	if Input.is_action_pressed("move_up_to"):
		move_and_collide(Vector2(0.0,-speed)*delta);
	elif Input.is_action_pressed("move_down_to"):
		move_and_collide(Vector2(0.0,speed)*delta);
		
func _on_up(player):
	move_and_collide(Vector2(0.0,-speed)*
	get_physics_process_delta_time());
			
func _on_down(player):
	move_and_collide(Vector2(0.0,speed)*
	get_physics_process_delta_time());
