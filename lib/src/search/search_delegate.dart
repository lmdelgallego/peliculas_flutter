import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculas = [
    'Spiderman',
    'Capitan America',
    'Batman',
    'Flash',
    'Acuaman',
    'Ironman',
    'Superman',
    'Ironman 2'
  ];
  final peliculasRecientes = [
    'Spiderman',
    'Capitan America',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izq del AppBar
    // return IconButton(icon: Icon(Icons.search), onPressed: null);
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar.
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Crea las sugerencias que aparece cando la persona escribe.

    final listaSugerida = query.isEmpty
        ? peliculasRecientes
        : peliculas
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[index]),
          onTap: () {
            seleccion = listaSugerida[index];
            showResults(context);
          },
        );
      },
    );
  }
}
