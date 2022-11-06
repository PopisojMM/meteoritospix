#CamaraJuego.gd
class_name CamaraJuego
extends Camera2D

## Atributos Export
export var variacion_zoom:float = 0.1
export var zoom_minimo: float = 0.8
export var zoom_maximo: float = 1.5

## Atributos
var zoom_original:Vector2
var puede_hacer_zoom: bool = true setget set_puede_hacer_zoom

## Atributos Onready
onready var tween_zoom:Tween = $TweenZoom

## Setter and Getters
func set_puede_hacer_zoom(puede: bool) -> void:
	puede_hacer_zoom = puede

## Metodos
func _ready() -> void:
	zoom_original = zoom

## Metodos Custom
func devolver_zoom_original() -> void:
	puede_hacer_zoom = false
	zoom_suavizado(zoom_original.x, zoom_original.y, 1.0)

func zoom_suavizado(nuevo_zoom_x: float, nuevo_zoom_y: float, tiempo_transicion: float) -> void:
	tween_zoom.interpolate_property(
		self,
		"zoom",
		zoom,
		Vector2(nuevo_zoom_x, nuevo_zoom_y),
		tiempo_transicion,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	tween_zoom.start()


