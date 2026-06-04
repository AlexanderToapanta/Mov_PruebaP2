import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../viewmodels/pokemon_viewmodel.dart";

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  final TextEditingController _searchController = TextEditingController();
  String _query = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(()=> Provider.of<CatBreedsViewmodel>(context, listen: false).loadBreeds());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
   
   
    @override
    Widget build(BuildContext context){
      final vm= Provider.of<CatBreedsViewmodel>(context);
      if(vm.loading){
        return Scaffold(
          body: Center(child: CircularProgressIndicator(),
          )
        );
      }
      if (vm.errorMessage != null) {
        return Scaffold(
          appBar: AppBar(title: Text("The Cat API")),
          body: Center(child: Text(vm.errorMessage!)),
        );
      }
      if (vm.breeds.isEmpty) {
        return Scaffold(
          appBar: AppBar(title: Text("The Cat API")),
          body: Center(child: Text("No hay razas de gatos para mostrar")),
        );
      }
      final filtered = vm.breeds.where((b) {
        final q = _query.trim().toLowerCase();
        if (q.isEmpty) return true;
        return b.name.toLowerCase().contains(q) || b.origin.toLowerCase().contains(q);
      }).toList();

      return Scaffold(
        appBar: AppBar(title: Text("The Cat API"),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Buscar raza o país (grep)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_,index){
                  final p = filtered[index];
                  return ListTile(
                    leading: Image.network(
                      p.imageUrl,
                      width: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.pets),
                    ),
                    title: Text(p.name),
                    subtitle: Text(p.origin),
                    onTap: (){
                      Navigator.pushNamed(context, "/detalle", arguments: p);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }