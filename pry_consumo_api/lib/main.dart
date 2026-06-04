import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import"data/datasource/pokeapi_datasource.dart";
import "data/repositories/pokemon_repository_implementation.dart";
import 'domain/entities/pokemones.dart';
import "domain/usecases/get_pokemones.dart";
import "presentation/viewmodels/pokemon_viewmodel.dart";
import "presentation/routes/app_routes.dart";
void main() {
  final datasource = CatApiDatasource();
  final repository = CatBreedsRepositoryImplementation(datasource);
  final useCase = GetCatBreeds(repository);
  runApp(MyApp(useCase:useCase));
}

    class MyApp extends StatelessWidget{
  final GetCatBreeds useCase;
  const MyApp({super.key, required this.useCase});
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CatBreedsViewmodel(useCase),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

