import 'package:flutter/material.dart';
void main() {
  runApp(MyApp()
  );
}

class Etudiant { 
  final String nom;
  final double moyenne;
  Etudiant({required this.nom, required this.moyenne});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
        routes: {
          '/details': (context) => DetailPage(),
        },
      );
    }
  }

  // ignore: use_key_in_widget_constructors
  class PageAccueil extends StatelessWidget {

    final List<Etudiant> etudiants = [
      Etudiant(nom: 'Alice', moyenne: 16.25),
      Etudiant(nom: 'Bob', moyenne: 16.5),
      Etudiant(nom: 'Charlie', moyenne: 11.75),
      Etudiant(nom: 'David', moyenne: 12.75),
      Etudiant(nom: 'Eve', moyenne: 13.5),
    ];

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Liste des étudiants'),
        ),
        body: Padding(
          padding:
            EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Liste des étudiants et de leurs moyennes :',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: etudiants.length,
                itemBuilder: (context, index) {
                  final etudiant = etudiants[index];
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 16.0
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                        BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text('Nom: ${etudiant.nom}'),
                      subtitle: Text('Moyenne : ${etudiant.moyenne}'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: etudiant,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Calculer la moyenne de la classe',
              style: TextStyle(fontSize: 16, color: Colors.white)
              ),
              onPressed: () {
                final average = calculateMoyenne(etudiants);
                moyenneAlertDialog(context, average); // Afficher l'alerte
              },
            ),
      ],
        ),
      ),
    );
  }


  double calculateMoyenne(List<Etudiant> etudiants) {
    double total = 0.0;
    for (var etudiant in etudiants ) {
      // ignore: unused_local_variable
      var total = 0;
      total + etudiant.moyenne;
    }
    return total / etudiants.length;

  }


  void moyenneAlertDialog(BuildContext context, double average) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Moyenne des étudiants'),
          content: Text('La moyenne des étudiants est : $average'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    final etudiant = ModalRoute.of(context)!.settings.arguments as Etudiant;

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'étudiant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nom de l\'étudiant : ${etudiant.nom}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Moyenne : ${etudiant.moyenne}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            AiP(),
          ],
        ),
      ),
    );
  }
}

class AiP extends StatelessWidget {
  const AiP({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Powered by '),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Icon(
          Icons.school_rounded,
          color: Colors.blue,
        ),
        Icon(
          Icons.code,
          color: Colors.blue,
        ),
        ElevatedButton(onPressed: () {  },
        child: Text('AI Programming')),
          ]
        ),
        
      ],
    );

  }
}