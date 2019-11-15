extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var poem_stanza_1 = $poem/stanza_1
onready var poem_stanza_2 = $poem/stanza_2
onready var poem_stanza_3 = $poem/stanza_3
onready var poem_stanza_4 = $poem/stanza_4
onready var poem_stanza_5 = $poem/stanza_5
onready var poem_stanza_6 = $poem/stanza_6
onready var author_name = $poem/author

onready var hills_layer1 = $hills_layers/hills_layer1
onready var hills_layer2 = $hills_layers/hills_layer2
onready var hills_layer3 = $hills_layers/hills_layer3
onready var hills_layer4 = $hills_layers/hills_layer4
onready var hills_layer5 = $hills_layers/hills_layer5
onready var hills_layer6 = $hills_layers/hills_layer6

onready var poem_stanzas = [poem_stanza_1,
					poem_stanza_2,
					poem_stanza_3,
					poem_stanza_4,
					poem_stanza_5,
					poem_stanza_6]
					
onready var hill_layers = [hills_layer1,
						hills_layer2,
						hills_layer3,
						hills_layer4,
						hills_layer5,
						hills_layer6]

var stanzaToShow = 1
var hillToShow = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if Input.is_key_pressed(KEY_SPACE):
		show_new_section()
	pass
	
func show_new_section():
	#print("Space is pressed")
	poem_stanzas[stanzaToShow].show()
	hill_layers[hillToShow].show()
	stanzaToShow = stanzaToShow + 1
	hillToShow = hillToShow + 1
	if stanzaToShow == 6:
		author_name.show()
	#print(stanzaToShow)
