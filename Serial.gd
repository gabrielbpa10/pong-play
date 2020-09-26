extends Node

const serial_res = preload("res://bin/gdserial.gdns")
onready var serial_port = serial_res.new()

var is_port_open = false
var text = ""

signal up(player)
signal down(player)
signal potentiometer(player, value)

func _ready():
	open()
	
func _exit_tree():
	close()

func open():
	serial_port.open_port("COM4", 9600)
	is_port_open = true
	
func close():
	is_port_open = false
	serial_port.close_port()

func _process(delta):
	if is_port_open:
		var t = serial_port.read_text()
		if t.length() > 0:
			for c in t:
				if c == "\n":
					on_text_received(text)
					text = ""
				else:
					text+=c

func on_text_received(text): #"1 Sobe"
	var command_array = text.split(" ")
	#print(command_array[0])
			
	if str(command_array[0]) == "Sobe":
		print("Up");
		emit_signal("up", command_array[0])
	elif command_array[0] == "Desce":
		print("Down");
		emit_signal("down", command_array[0])
	elif command_array[0] == "Player2":
		print(command_array[1]);
		emit_signal("potentiometer", command_array[0], 
		command_array[1])
