extends TileMapLayer

@onready var tall_grass_scene = preload("res://Overworld/tall_grass.tscn")

func _ready():
	find_and_spawn_interactive_tiles()

func find_and_spawn_interactive_tiles():
	var tile_data = get_used_cells()
	for i in range(0, tile_data.size()):
		var tile := get_cell_tile_data(tile_data[i])
		if tile.get_custom_data("tileType") == "tallGrass":
			set_cell(tile_data[i],-1)
			var tall_grass = tall_grass_scene.instantiate()
			var pos = map_to_local(tile_data[i])
			tall_grass.position = Vector2(pos.x-8, pos.y+8)
			add_child(tall_grass)
		else: # if no matching rule
			continue
