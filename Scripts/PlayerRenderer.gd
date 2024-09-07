extends Node2D
class_name PlayerRenderer

@onready var player:CharacterBody2D

var current_orientation:int = 0

var orientations:Array[Node2D]


func _ready() -> void:
	orientations.append(find_child("FRONT"))
	orientations.append(find_child("BACK"))
	orientations.append(find_child("LEFT"))
	orientations.append(find_child("RIGHT"))
	
	player = get_parent()

func _physics_process(delta: float) -> void:
	
	
	for orientation_idx in range(orientations.size()):
		if orientation_idx != current_orientation:
			orientations[orientation_idx].visible = false
		else:
			orientations[orientation_idx].visible = true
		
	get_player_orientation()
	

func get_player_orientation():
	
	if player.velocity.x != 0:
		current_orientation = int(player.velocity.x >= 1) + 2
	if player.velocity.y != 0:
		current_orientation = player.velocity.y <= 1
