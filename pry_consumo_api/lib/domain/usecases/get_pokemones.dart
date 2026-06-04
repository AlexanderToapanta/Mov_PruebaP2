import '../entities/pokemones.dart';
import '../../data/repositories/pokemon_repository_implementation.dart';

class GetCatBreeds {
  final CatBreedsRepositoryImplementation repository;

  GetCatBreeds(this.repository);

  Future<List<CatBreed>> call([int limit = 20, int offset = 0]) async {
    return repository.getBreeds(limit, offset);
  }
}
