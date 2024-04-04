// ignore_for_file: camel_case_types, file_names,

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_note/repository/settingsModel.dart';
import 'package:tp_note/views/jeu.dart';

class nombreMagique extends StatefulWidget {
  const nombreMagique({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _JeuState createState() => _JeuState();
}

class _JeuState extends State<nombreMagique> {
  final _random = Random();
  late int _magicNumber;
  int _userGuess = 0;
  int _attempts = 0;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    final niveau = context.read<SettingsViewModel>().niveau;
    _magicNumber = _random.nextInt((niveau) * 100);
    _attempts = 0;
  }

  void _checkGuess() {
    setState(() {
      _attempts++;
    });

    if (_userGuess < _magicNumber) {
      _showSnackBar('Trop bas !');
    } else if (_userGuess > _magicNumber) {
      _showSnackBar('Trop haut !');
    } else {
      _showSnackBar(
          'Bravo ! Vous avez trouvé le nombre magique en $_attempts essais.');
      context.read<SettingsViewModel>().addScore(
            context.read<SettingsViewModel>().pseudo,
            _attempts.toString(),
            context.read<SettingsViewModel>().niveau.toString(),
          );
      int niveauActuel = context.read<SettingsViewModel>().niveau;
      if (niveauActuel < 30) {
        if (context.read<SettingsViewModel>().niveauJeu == niveauActuel) {
          context.read<SettingsViewModel>().niveauJeu = niveauActuel + 1;
        }
        context.read<SettingsViewModel>().niveau = niveauActuel + 1;
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Jeu()),
      );
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeu du Nombre Mystère'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Devinez le nombre Mystère entre 0 et ${context.read<SettingsViewModel>().niveau * 100}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Votre Guess",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez insérer un numéro';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _userGuess = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkGuess,
              child: const Text('Valider'),
            ),
            const SizedBox(height: 20),
            Text(
              'Nombre d\'essais: $_attempts',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
