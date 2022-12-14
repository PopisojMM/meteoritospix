#EnemigoDummy.gd
extends Node2D

## Atributos
var hitpoints:float = 10.0

## Metodos

func _process(delta: float) -> void:
	$Canion.set_esta_disparando(true)

## Metodos Custom
func recibir_danio(danio: float) -> void:
	hitpoints -= danio
	if hitpoints <= 0.0:
		queue_free()

func _on_Area2D_body_entered(body):
	if body is Player:
		body.destruir()

