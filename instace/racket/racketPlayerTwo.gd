extends KinematicBody2D

export var speed = 400;
var valueAux = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	Serial.connect("potentiometer",self,"_on_potentiometer");
	
func _physics_process(delta):
	if Input.is_action_pressed("move_up"):
		move_and_collide(Vector2(0.0,-speed)*delta);
	elif Input.is_action_pressed("move_down"):
		move_and_collide(Vector2(0.0,speed)*delta);

func _on_potentiometer(player,value):
		if int(value) > valueAux:
			move_and_collide(Vector2(0.0,speed)*
			get_physics_process_delta_time());
			valueAux = int(value);
		elif int(value) < valueAux:
			move_and_collide(Vector2(0.0,-speed)*
			get_physics_process_delta_time());
			valueAux = int(value);
