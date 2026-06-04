import "package:flutter/material.dart";
import "../../domain/entities/pokemones.dart";

class DetallePage extends StatelessWidget{
 DetallePage({super.key});
  @override
  Widget build(BuildContext context) {

    final CatBreed breed = ModalRoute.of(context)!.settings.arguments as CatBreed;
    return Scaffold(
      appBar: AppBar(title: Text(breed.name.toUpperCase()),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              breed.imageUrl,
              width: 150,
              errorBuilder: (_, __, ___) => const Icon(Icons.pets, size: 96),
            ),
            SizedBox(height: 20,),
            Text("ID: ${breed.id}", style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            Text("Nombre: ${breed.name}", style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            Text("Origen: ${breed.origin}", style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            Text("Temperamento: ${breed.temperament}", style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Text("Vida: ${breed.lifeSpan} años", style: TextStyle(fontSize: 18),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                breed.description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}