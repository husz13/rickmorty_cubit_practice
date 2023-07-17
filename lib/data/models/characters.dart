class Character {
  late String id;
  late String name;
  late String species;
  late String status;
  late String type;
  late String gender;
  late Map<String, dynamic> origin;
  late String location;
  late String image;
  late List<dynamic> episodes;
  late String createdDate;

  Character.fromJson(Map<String, dynamic> jsonFile) {
    id = jsonFile["id"];
    name = jsonFile["name"];
    status = jsonFile["status"];
    species = jsonFile["species"];
    type = jsonFile["type"];
    gender = jsonFile["gender"];
    origin = jsonFile["origins"];
    location = jsonFile["location"];
    image = jsonFile["image"];
    episodes = jsonFile["episode"];
    createdDate = jsonFile["created"];
  }
}
