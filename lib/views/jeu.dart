import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_note/repository/settingsModel.dart';
import 'package:tp_note/views/nombreMagique.dart';

class Jeu extends StatelessWidget {
  const Jeu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Démarrer une partie'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: FormWidget(),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String _pseudo = '';

  @override
  Widget build(BuildContext context) {
    final niveau = context.read<SettingsViewModel>().niveau;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Pseudo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez insérer votre pseudo';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _pseudo = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              children: List.generate(
                30,
                (index) => buildLevelItem(
                  index,
                  context.read<SettingsViewModel>().niveauJeu,
                  "Nombre mystère",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlue,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submit();
                      }
                    },
                    child: Center(
                      child: Text(
                        "Nombre mystère \n Niveau: $niveau",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLevelItem(int index, int niveau, String jeu) {
    return GestureDetector(
      onTap: () {
        if (index < niveau) {
          context.read<SettingsViewModel>().niveau = index + 1;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Jeu(),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index < niveau ? Colors.green : Colors.red,
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Icon(
                index < context.read<SettingsViewModel>().niveauJeu
                    ? Icons.lock_open
                    : Icons.lock,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<SettingsViewModel>().pseudo = _pseudo;

      // Récupérez le niveau actuel du joueur
      int niveauActuel = context.read<SettingsViewModel>().niveau;

      if (niveauActuel < 30) {

        if(context.read<SettingsViewModel>().niveauJeu == niveauActuel){
          context.read<SettingsViewModel>().niveauJeu += 1;
        }
        
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const nombreMagique()),
      );
    }
  }
}
