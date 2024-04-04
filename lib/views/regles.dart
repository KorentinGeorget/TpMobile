import 'package:flutter/material.dart';

class Regles extends StatelessWidget {
  const Regles({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explication des règles'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Principe :",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              "Le jeu du nombre mystère consiste à deviner un nombre généré aléatoirement. Pour ce faire, le joueur propose un nombre et tant que ce dernier n'est pas égal au nombre à trouver, le jeu lui indiquera si sa proposition est inférieure ou supérieure au nombre mystère.",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "Niveaux :",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              "Dans ce jeu, les différents niveaux sont déterminés par la plage du nombre généré aléatoirement. Par exemple, au niveau 1, le nombre se situe entre 0 et 100, pour le niveau deux, il pourra être compris entre 0 et 10000 et ainsi de suite.",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "Classement :",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              "Votre classement est déterminé par le niveau atteint et le nombre d'essais nécessaires pour terminer ce niveau.",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
