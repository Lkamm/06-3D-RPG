extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")
var dialogue = [
	"Welcome to the game (Press E to continue)"
	,"Find and destroy all the targets to find the secret pizza! (Press E to continue)"
	,"Come back to me once you have done so"
]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if body.name == "Player":
		Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	if body.name == "Player":
		Dialogue.hide_dialogue()

func finished():
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
