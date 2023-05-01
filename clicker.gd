extends Node2D

@export var item_name = "Name"
@export var items = 0
@export var staring_click_value = 5
@export var quit_threshold = 100
signal job_done

# Called when the node enters the scene tree for the first time.
func _ready():
	_write_counter()
	$Canvas/Label.text = item_name
	
func _on_button_down():
	$"Canvas/Click Sound".play()

	var click_value = staring_click_value - items / 10;
	if click_value < 1:
		click_value = 1
	items += click_value
	_write_counter()
	if items > quit_threshold:
		$"Canvas/Quit Button".visible = true

func _write_counter():
	$Canvas/Counter.text = str(items)
#	$Canvas/Counter.text = "Cookies: " + str(cookies)

func _on_quit_button_pressed():
	job_done.emit()
#	get_tree().change_scene_to_file("res://job_board.tscn")



