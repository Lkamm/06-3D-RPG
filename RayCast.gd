extends RayCast

onready var Player = get_node("/root/Game/Player")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _physics_process(_delta):
	if is_colliding():
		Player.target = get_collider()
		var pos = get_collision_point()
		$Reticle.global_transform.origin = pos
	elif $Reticle.translation != Vector3(0, 0, 50):
		$Reticle.translation = Vector3(0, 0, 50)
		Player.target != null	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
