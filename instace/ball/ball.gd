extends KinematicBody2D

export var speed = Vector2(100,100);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	var collision = move_and_collide(speed * delta);
	if collision:
		if collision.collider.is_in_group("bottom-wall"):
			speed.y = (speed.y*-1) - 10;
		elif collision.collider.is_in_group("top-wall"):
			speed.y = (speed.y*-1) + 10;
		elif collision.collider.is_in_group("raquete"):
			speed.x = (speed.x + 100)*-1;
		elif collision.collider.is_in_group("left-wall"):
			update_leaderboard_two();
			restart_jogo();
		elif collision.collider.is_in_group("right-wall"):
			update_leaderboard_one();
			restart_jogo();
			

func starting_position():
			position.x = 248;
			position.y = 169.0;

func restart_jogo():
			starting_position();
			speed = Vector2(0,0);
			yield(get_tree().create_timer(2),"timeout");
			speed = Vector2(100,100);

func update_leaderboard_one():
		get_tree().call_group('scoreboard-one','update_leaderboard');

func update_leaderboard_two():
		get_tree().call_group('scoreboard-two','update_leaderboard');
