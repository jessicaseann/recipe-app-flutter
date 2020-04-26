
class Recipe {

  final int id; 
  final String image; 
  final String title; 
  final int readyInMinutes; 
  final int servings; 

  Recipe({this.title, this.id, this.image, this.servings, this.readyInMinutes});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["id"],
      title: json["title"], 
      image: json["image"], 
      readyInMinutes: json["readyInMinutes"], 
      servings: json["servings"], 
    );
  }

}