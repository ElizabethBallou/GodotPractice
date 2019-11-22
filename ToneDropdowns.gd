extends Control

export (NodePath) var Choice0_path
onready var dropdown0 = get_node(Choice0_path)
export (NodePath) var Choice1_path
onready var dropdown1  = get_node(Choice1_path)
export (NodePath) var Choice2_path
onready var dropdown2 = get_node(Choice2_path)

onready var dropdownArray = [dropdown0,
							dropdown1,
							dropdown2]

onready var musicSelectionArray = []

func _ready():
	add_items()
	
func add_items():
	for entry in dropdownArray:
		entry.add_item("A")
		entry.add_item("C")
		entry.add_item("D")
		entry.add_item("D#/E flat")
		entry.add_item("F")
		entry.add_item("G")
	

func _on_Choice0_item_selected(ID):
	print_debug(str(dropdown0.get_item_text(ID)))
	var toneName = str(dropdown0.get_item_text(ID))
	musicSelectionArray.append(toneName)


func _on_Choice1_item_selected(ID):
	print_debug(str(dropdown1.get_item_text(ID)))
	var toneName = str(dropdown1.get_item_text(ID))
	musicSelectionArray.append(toneName)

func _on_Choice2_item_selected(ID):
	print_debug(str(dropdown2.get_item_text(ID)))
	var toneName = str(dropdown2.get_item_text(ID))
	musicSelectionArray.append(toneName)
	
