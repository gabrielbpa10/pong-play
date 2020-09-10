extends HBoxContainer

export var value = 0;

func ready():
	pass # Replace with function body.
	#_atualizar()

func update_leaderboard():
	value +=1;
	$Label.text = str(value);
