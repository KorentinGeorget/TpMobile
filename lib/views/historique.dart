import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_note/repository/settingsModel.dart';

class Historique extends StatelessWidget {
  const Historique({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsModel = context.watch<SettingsViewModel>();

    // Charger les données à chaque fois que la page est construite
    settingsModel.getSettingsPseudo();
    settingsModel.getSettingsEssais();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique des parties'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildScoreList(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreList(BuildContext context) {
    final settingsModel = context.watch<SettingsViewModel>();
    final scores = settingsModel.nombreEssais;

    if (scores == [] || scores.isEmpty) {
      return const Center(
        child: Text(
          'Aucun score enregistré',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: scores.length,
      itemBuilder: (context, index) {
        final score = scores[scores.length - 1 - index];
        final scoreInfo = score.split(':');
        final pseudo = scoreInfo[0];
        final scoreValue = scoreInfo[1];
        final niveau = scoreInfo[2];


        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              '$pseudo - Niveau: $niveau',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Nombre d\'essais: $scoreValue',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
