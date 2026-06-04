import '../../../domain/entities/pokemones.dart';
import 'package:pry_consumo_api/data/datasource/pokeapi_datasource.dart';

class CatBreedsRepositoryImplementation {
  final CatApiDatasource datasource;

  CatBreedsRepositoryImplementation(this.datasource);

  Future<List<CatBreed>> getBreeds(int limit, int offset) async {
    return datasource.fetchBreeds(limit, offset);
  }
}