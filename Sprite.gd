extends Sprite

onready var tween = get_node("Tween")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("this function is running")
	tween.interpolate_property(self, "modulate:a", self.modulate.a, 0.0, 1,
        Tween.TRANS_QUAD, Tween.EASE_IN_OUT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

