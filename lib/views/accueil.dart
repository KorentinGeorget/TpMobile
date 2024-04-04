import 'package:flutter/material.dart';
import 'package:tp_note/views/historique.dart';
import 'package:tp_note/views/jeu.dart';
import 'package:tp_note/views/regles.dart';
// import 'package:td2_flutter/ui/explicationregle.dart';
// import 'package:td2_flutter/ui/games.dart';
// import 'package:td2_flutter/ui/voirscore.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Jeu()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              child: const Text('Jouer au jeu', style: TextStyle(fontSize: 25)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Historique()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              child: const Text('Voir historique des parties',
                  style: TextStyle(fontSize: 25)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Regles()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              child:
                  const Text('Règles du jeu', style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
