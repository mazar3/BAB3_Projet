import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tick',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

// Première page : Écran d'accueil avec logo et bouton "Continuer"
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue sur Tick'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset('assets/logo.png', width: 250, height: 250),
            ),
            // Utilisation d'un Spacer pour occuper l'espace restant
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TickListPage()),
                  );
                },
                child: const Text('Continuer'),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Deuxième page : Liste des Ticks avec bouton "Ajouter"
class TickListPage extends StatelessWidget {
  const TickListPage({Key? key}) : super(key: key); // Ajout du paramètre key

  // Liste statique de Ticks pour l'exemple
  static const List<Map<String, String>> ticks = [
    {'name': 'Tick 1', 'position': 'à Mons il y a 1h'},
    {'name': 'Tick 2', 'position': 'à Bruxelles il y a 2h'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Ticks'),
      ),
      body: ListView.builder(
        itemCount: ticks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ticks[index]['name'] ?? 'Nom inconnu'), // Gestion des nulls
            subtitle: Text(ticks[index]['position'] ?? 'Position inconnue'), // Gestion des nulls
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // La navigation vers la page 3 sera ajoutée plus tard
        },
        child: Icon(Icons.add),
      ),
    );
  }
}