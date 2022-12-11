extends Control

var dialogue = []
var dialogue_pos = 0
signal finished_dialogue
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func start_dialogue(d):
	dialogue = d.duplicate()
	dialogue_pos = 0
	show()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if dialogue.size() and dialogue_pos < dialogue.size():
		var d = "[center]" + dialogue[dialogue_pos] + "[/center]"
		if $Text.bbcode_text != d:
			$Text.bbcode_text = d
			if Input.is_action_just_pressed("action"):
				dialogue_pos += 1
			elif dialogue.size():
				emit_signal("finished_dialogue")
				hide_dialogue()

func hide_dialogue():
	dialogue = []
	dialogue_pos = 0
	hide()
