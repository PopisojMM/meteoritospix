extends Control

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pausa"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		visible = not visible
		get_tree().paused = not get_tree().paused

func _on_BotonContinuar_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = false
	visible = false

func _on_BotonMenuPrincipal_pressed():
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://juego/UI/MenuPrincipal.tscn")
