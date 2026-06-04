import '../../domain/entities/pokemones.dart';

class CatBreedModel extends CatBreed {
  CatBreedModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.origin,
    required super.temperament,
    required super.lifeSpan,
    required super.description,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    final image = json["image"] as Map<String, dynamic>?;
    final imageUrl = (image?["url"] as String?) ??
        "https://cdn2.thecatapi.com/images/placeholder.jpg";

    return CatBreedModel(
      id: json["id"]?.toString() ?? "",
      name: json["name"] as String? ?? "Sin nombre",
      imageUrl: imageUrl,
      origin: json["origin"] as String? ?? "Desconocido",
      temperament: json["temperament"] as String? ?? "Desconocido",
      lifeSpan: json["life_span"] as String? ?? "Desconocido",
      description: json["description"] as String? ?? "Sin descripción",
    );
  }
}