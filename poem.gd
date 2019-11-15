extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var poem_stanza_1 = get_node("stanza_1")
onready var poem_stanza_2 = get_node("stanza_2")
onready var poem_stanza_3 = get_node("stanza_3")
onready var poem_stanza_4 = get_node("stanza_4")
onready var poem_stanza_5 = get_node("stanza_5")
onready var poem_stanza_6 = get_node("stanza_6")

onready var poem_stanzas = [poem_stanza_1,
					poem_stanza_2,
					poem_stanza_3,
					poem_stanza_4,
					poem_stanza_5,
					poem_stanza_6]

onready var button = get_node("Button")
var stanzaToShow = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		#print("Space is pressed")
		poem_stanzas[stanzaToShow].show()
		stanzaToShow =+ 1
		print(stanzaToShow)
		
	pass
