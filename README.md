# Godot4-Individual-Items-load
Load json files from a directory individualy 

# HOW THIS WORKS

what does this script work for? well, it is for those who want to load several separate jsons files in a single folder, and put them in a dictionary, for example.
![alt text](image (16).png)
this is for mod proposals or dlcs, but also for the case of loading several items organized in their own folder.
![alt text](./image(17).png)
# HOW IT CAN WORK

it needs to contain the "name" field in your json file to work.

First, you define a variable called directoryPath that stores the path to the directory where your JSON files are located. You also define an exported variable called itemData, which is an empty dictionary that will store all of the item data loaded from the JSON files.

In the _ready function, you call a custom function called load_json_files, which takes the directoryPath as an argument. This function uses the DirAccess class to iterate through the files in the directory and load any files with the extension .json. For each JSON file, it calls another custom function called load_json_file, which reads the file and parses its contents using the JSON class. If the parsed data is a dictionary (which is what you expect for your JSON files), it is merged into the itemData dictionary using the merge_json_data function.

The merge_json_data function takes a dictionary containing item data and merges it into the itemData dictionary, using the item's name as the key. If the key already exists in itemData, a warning message is printed.

# HOW TO INSTALL

Paste this godot4 script in your folder, and load as singleton.
