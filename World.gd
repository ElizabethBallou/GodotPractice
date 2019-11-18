extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var poem_stanza_0 = $poem/stanza_0
onready var poem_stanza_1 = $poem/stanza_1
onready var poem_stanza_2 = $poem/stanza_2
onready var poem_stanza_3 = $poem/stanza_3
onready var poem_stanza_4 = $poem/stanza_4
onready var poem_stanza_5 = $poem/stanza_5
onready var author_name = $poem/author

onready var hills_layer0 = $hills_layers/hills_layer0
onready var hills_layer1 = $hills_layers/hills_layer1
onready var hills_layer2 = $hills_layers/hills_layer2
onready var hills_layer3 = $hills_layers/hills_layer3
onready var hills_layer4 = $hills_layers/hills_layer4
onready var hills_layer5 = $hills_layers/hills_layer5

onready var poem_stanzas = [poem_stanza_0,
					poem_stanza_1,
					poem_stanza_2,
					poem_stanza_3,
					poem_stanza_4,
					poem_stanza_5]
					
onready var hill_layers = [hills_layer0,
						hills_layer1,
						hills_layer2,
						hills_layer3,
						hills_layer4,
						hills_layer5]

var stanzaToShow = 0
var hillToShow = 0

onready var SpriteTween = get_node("hills_layers/hills_layer" + str(hillToShow) + "/Tween")
onready var TextTween = get_node("poem/stanza_" + str(stanzaToShow) + "/Tween")

# Called when the node enters the scene tree for the first time.
func _ready():
	TextTween.interpolate_property(poem_stanzas[0], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	TextTween.start()
	SpriteTween.interpolate_property(hill_layers[0], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	SpriteTween.start()
	stanzaToShow = stanzaToShow + 1
	hillToShow = hillToShow + 1
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_SPACE):
		show_new_section()
	pass
	
func show_new_section():
	if stanzaToShow >=1 && stanzaToShow <= 5:
		# poem_stanzas[stanzaToShow].show()
		TextTween.interpolate_property(poem_stanzas[stanzaToShow], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		TextTween.start()
		# hill_layers[hillToShow].show()
		SpriteTween.interpolate_property(hill_layers[hillToShow], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
		SpriteTween.start()
		stanzaToShow = stanzaToShow + 1
		hillToShow = hillToShow + 1
		
		if stanzaToShow == 6:
			author_name.show()
		
	elif stanzaToShow == 7:
		for x in range (0, poem_stanzas.size):
			poem_stanzas[x].hide()
		for x in range (0, hill_layers.size):
			hill_layers[x].hide()
		hill_layers[0].show()
		poem_stanzas[0].show()
		stanzaToShow = 1
		hillToShow = 1
