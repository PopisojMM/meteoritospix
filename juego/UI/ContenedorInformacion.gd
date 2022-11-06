#ContenedorInformacion.gd
class_name ContenedorInformacion
extends NinePatchRect

var esta_activo:bool = true setget set_esta_activo

## Atributos Export
export var auto_ocultar:bool = false setget set_auto_ocultar

## Getter & Setters
func set_auto_ocultar(valor: bool) -> void:
	auto_ocultar = valor

func set_esta_activo(valor: bool) -> void:
	esta_activo = valor

## Atributos Onready
onready var texto_contenedor:Label = $Label
onready var auto_ocultar_timer:Timer = $AutoOcultarTimer
onready var animaciones:AnimationPlayer = $AnimationPlayer

## Metodos
func mostrar() -> void:
	if esta_activo:
		$AnimationPlayer.play("mostrar")

func ocultar() -> void:
	if not esta_activo:
		animaciones.stop()
	$AnimationPlayer.play("ocultar")

func mostrar_suavizado() -> void:
	if not esta_activo:
		return
	$AnimationPlayer.play("mostrar_suavizado")
	if auto_ocultar:
		auto_ocultar_timer.start()

func ocultar_suavizado() -> void:
	if esta_activo:
		$AnimationPlayer.play("ocultar_suavizado")

func modificar_texto(text: String) -> void:
	texto_contenedor.text = text

func _on_AutoOcultarTimer_timeout() -> void:
	ocultar_suavizado()
