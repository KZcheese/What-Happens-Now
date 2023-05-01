extends Node2D

signal job_started(job_name)
var art_clicker = preload("res://art_clicker.tscn")
var tech_clicker = preload("res://tech_clicker.tscn")
var cookie_clicker = preload("res://cookie_clicker.tscn")
var stonks_clicker = preload("res://stonks_clicker.tscn")

var instance
var programmed = false
var baked = false
var drawn = false
var stonked = false

func _on_programmer_button_pressed():
	instance = tech_clicker.instantiate()
	programmed = true
	_start_job()

func _on_cookie_button_pressed():
	instance = cookie_clicker.instantiate()
	baked = true
	_start_job()

func _on_artist_button_pressed():
	instance = art_clicker.instantiate()
	drawn = true
	_start_job()

func _on_stonks_button_pressed():
	instance = stonks_clicker.instantiate()
	stonked = true
	_start_job()

func _start_job():
	$"Canvas/Button Click".play()
	add_child(instance)
	instance.job_done.connect(_on_job_done)


func _on_job_done():
	remove_child(instance)
	if programmed and baked and drawn and stonked:
		$"Canvas/Give Up Button".visible = true

func _on_give_up_button_pressed():
	get_tree().change_scene_to_file("res://bliss.tscn")
