extends Node

var player
var secondBoss

var last_level

var mortes: int
var estrelas: int
var time: String
var seconds: int
var minutes: int
var zerou: bool

var can_pause: bool

var save_path: String = "user://save.dat"

var data_dictionary = {
	"last_level": last_level,
	"deaths": mortes,
	"stars": estrelas,
	"seconds": seconds,
	"minutes": minutes,
	"zerou": zerou
}

func save_data() -> void:
	var file: File = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data_dictionary)
		file.close()

func load_game() -> void:
	var file: File = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			data_dictionary = file.get_var()
			file.close()
