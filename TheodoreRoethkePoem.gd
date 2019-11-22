extends Node2D

onready var poem_stanza_0 = $poem/stanza_0
onready var poem_stanza_1 = $poem/stanza_1
onready var poem_stanza_2 = $poem/stanza_2
onready var poem_stanza_3 = $poem/stanza_3
onready var poem_stanza_4 = $poem/stanza_4
onready var poem_stanza_5 = $poem/stanza_5
onready var author_name = $poem/Author

onready var forest_object_0 = $forest_layers/forest_layers_0
onready var forest_object_1 = $forest_layers/forest_layers_1
onready var forest_object_2 = $forest_layers/forest_layers_2
onready var forest_object_3 = $forest_layers/forest_layers_3
onready var forest_object_4 = $forest_layers/forest_layers_4
onready var forest_object_5 = $forest_layers/forest_layers_5

onready var poem_stanzas = [poem_stanza_0,
					poem_stanza_1,
					poem_stanza_2,
					poem_stanza_3,
					poem_stanza_4,
					poem_stanza_5]
					
onready var forest_objects = [forest_object_0,
					forest_object_1,
					forest_object_2,
					forest_object_3,
					forest_object_4,
					forest_object_5]
					
onready var RoethkeMusicTone0 = get_node("Music streams/C_Drone")
onready var RoethkeMusicTone1 = get_node("Music streams/E_Drone")
onready var RoethkeMusicTone2 = get_node("Music streams/G_Drone")

var stanzaToShow = 0
var forestObjectToShow = 0

var tweenTime = 1.2


onready var SpriteTween = get_node("forest_layers/forest_layers_" + str(forestObjectToShow) + "/Tween")
onready var TextTween = get_node("poem/stanza_" + str(stanzaToShow) + "/Tween")
onready var AuthorTween = get_node("poem/Author/Tween")
onready var ButtonTween = get_node("MainSceneButton/Tween")

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainSceneButton.hide()
	TextTween.interpolate_property(poem_stanzas[0], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), tweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN)
	TextTween.start()
	SpriteTween.interpolate_property(forest_objects[0], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, .8), tweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN)
	SpriteTween.start()
	stanzaToShow = stanzaToShow + 1
	forestObjectToShow = forestObjectToShow + 1
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_SPACE):
		show_new_section()
	pass
	
func show_new_section():
	print_debug(forestObjectToShow)
	print_debug(stanzaToShow)
	if stanzaToShow >=1 && stanzaToShow <= 5:
		# poem_stanzas[stanzaToShow].show()
		TextTween.interpolate_property(poem_stanzas[stanzaToShow], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), tweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN)
		TextTween.start()
		# hill_layers[hillToShow].show()
		SpriteTween.interpolate_property(forest_objects[forestObjectToShow], "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, .8), tweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN)
		SpriteTween.start()
		
		if stanzaToShow == 1:
			RoethkeMusicTone0.play(0)
		
		if stanzaToShow == 3:
			RoethkeMusicTone1.play(0)
		
		if stanzaToShow == 5:
			RoethkeMusicTone2.play(0)
			AuthorTween.interpolate_property($poem/Author, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), tweenTime, Tween.TRANS_LINEAR, Tween.EASE_IN)
			AuthorTween.start()
			$MainSceneButton.show()
			
		stanzaToShow = stanzaToShow + 1
		forestObjectToShow = forestObjectToShow + 1
		

		


func _on_MainSceneButton_pressed():
	print_debug("I'm getting clicked")
	RoethkeMusicTone0.stop()
	RoethkeMusicTone1.stop()
	RoethkeMusicTone2.stop()
	get_tree().change_scene("res://TitleScene.tscn")
