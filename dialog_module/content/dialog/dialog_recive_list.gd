extends PanelContainer

signal pressed(id, type, text)

const ReciveDialogLinePKG := preload("res://dialog_module/content/dialog/recive_dialog_line.tscn")
const ReciveDialogLineGD := preload("res://dialog_module/content/dialog/recive_dialog_line.gd")

@onready var _recive_list: VBoxContainer = %ReciveList

func _ready() -> void:
	clear()

func clear() -> void :
	for node in get_children() :
		node.queue_free()

func add_dialog(id: int, text: String, oneshot: bool = true) -> void :
	var recive_line: ReciveDialogLineGD = ReciveDialogLinePKG.instantiate()
	recive_line.id = id
	recive_line.text = text
	recive_line.oneshot = oneshot
	_recive_list.add_child(recive_line)
	_recive_list.pressed.connect(_on_dialog_pressed)

func _on_dialog_pressed(id: int, type: int, text: String) -> void :
	pressed.emit(id, type, text)
