import 'package:flutter/material.dart';
import '../../domain/entities/pokemones.dart';
import '../../domain/usecases/get_pokemones.dart';

class CatBreedsViewmodel extends ChangeNotifier {
  final GetCatBreeds getCatBreedsUseCase;

  CatBreedsViewmodel(this.getCatBreedsUseCase);

  List<CatBreed> breeds = [];
  bool loading = false;
  String? errorMessage;

  Future<void> loadBreeds() async {
    loading = true;
    notifyListeners();
    try {
      breeds = await getCatBreedsUseCase();
      errorMessage = null;

    } catch (e) {
      errorMessage = "Error al cargar gatos";
    } finally {
      loading = false;
      notifyListeners();
      return;
    }
  }
}