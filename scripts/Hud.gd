extends Control

var segundos = 0
var minutos = 0

var time = "00:00"

var pode_timer

func kill_timer() -> void:
	Global.time = time
	Global.seconds = segundos
	Global.minutes = minutos
	$tempo.hide()
	pode_timer = false

func return_timer() -> void:
	$tempo.show()
	pode_timer = true
	$seconds_counter.start()

func _process(_delta: float) -> void:
	if minutos < 10 and segundos < 10:
		time = "0" + str(minutos) + ":" + "0" + str(segundos)
	elif minutos > 10 and segundos < 10:
		time = str(minutos) + ":" + "0" + str(segundos)
	elif minutos > 10 and segundos > 10:
		time = str(minutos) + ":" + str(segundos)
	elif minutos < 10 and segundos > 10:
		time = "0" + str(minutos) + ":" + str(segundos)
	
	$tempo.text = time

func _on_seconds_counter_timeout() -> void:
	if pode_timer:
		segundos += 1
		if segundos == 60:
			minutos += 1
			segundos = 0
		$seconds_counter.start()
