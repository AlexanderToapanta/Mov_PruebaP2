import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon_model.dart';

class CatApiDatasource {
  static const String baseUrl =
      "https://api.thecatapi.com/v1/breeds";

  static const String apiKey =
      "live_dV3ZgnZkjXusIRpNfVZGehsyuNRfOpfWIWXD11V2d2G8RYFivn17GFi30fyxMRZs";

  Future<List<CatBreedModel>> fetchBreeds(int limit, int offset) async {

    final url = Uri.parse(
      "$baseUrl?limit=$limit&page=${offset ~/ limit}",
    );

    final resp = await http.get(
      url,
      headers: {
        "x-api-key": apiKey,
      },
    );

    if (resp.statusCode != 200) {
      throw Exception("Error al cargar gatos");
    }

    final List data = jsonDecode(resp.body);

    return data
        .map((e) => CatBreedModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}