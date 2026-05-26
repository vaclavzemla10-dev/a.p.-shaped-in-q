extends TextureButton

@onready var pause_menu: Control = $"."
@onready var home: TextureButton = $"."

func _ready() -> void:
	pause_menu.visible = false

func _on_pressed() -> void:
	pause_menu.visible = true
