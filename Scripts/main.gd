extends Node2D

static var p1: CharacterBody2D
static var p2: CharacterBody2D

signal side_changed()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	p1= $Player1
	p2= $Player2


# pos_dif is x position difference. player 1 position minus player 2 position. used to determine which side the player is on.

func pos_dif():
	return (p1.position[0] - p2.position[0])

var pos_time = 0
var p1_past_side
var p1_current_side

func player_side_change():

	if p1.position[0] <= p2.position[0]:
		p1_current_side = "left"
	elif p1.position[0] > p2.position[0]:
		p1_current_side = "right"

	if pos_time == 0:
		pos_time += 1
	
	elif pos_time > 0:
		if p1_past_side != p1_current_side:
			side_changed.emit()

	p1_past_side = p1_current_side


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_side_change()
	