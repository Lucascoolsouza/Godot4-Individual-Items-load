extends Node

var directoryPath = "res://Data2" # Need to be the directory of the jsons file
@export var itemData = {} # A example, im loading json of items

func _ready():
	itemData = load_json_files(directoryPath) #So my data of items is equal a lot of json file.
	
func load_json_files(directoryPath : String):
	var dir = DirAccess.open(directoryPath)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			var file_path = directoryPath + "/" + file_name
			if !dir.current_is_dir():
				var file_extension = file_name.get_extension().to_lower()
				if file_extension == "json":
					var json_data = load_json_file(file_path)
					merge_json_data(json_data)
					if json_data.has("name"):
						var item_name = json_data["name"]
						if itemData.has(item_name):
							print("Warning: Duplicate key in itemData:", item_name)
						itemData[item_name] = json_data
				else:
					print("Unsupported file:", file_path)
					pass
			file_name = dir.get_next()
	else:
		print("Error accessing the directory.")
	return itemData
func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error reading file:", filePath)
	else:
		print("File does not exist:", filePath)
		
func merge_json_data(jsonData: Dictionary):
	var itemName = jsonData["nome"]
	if itemData.has(itemName):
		print("Warning: Duplicate key in itemData:", itemName)
	else:
		itemData[itemName] = jsonData
