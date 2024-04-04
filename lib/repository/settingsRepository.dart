import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  // ignore: constant_identifier_names
  static const PSEUDO_KEY = "pseudo";
  // ignore: constant_identifier_names
  static const ESSAIS_KEY = "essais";
  // ignore: constant_identifier_names
  static const NIVEAU_KEY = "niveau";
  // ignore: constant_identifier_names
  static const NIVEAUJEU_KEY = "niveauJeu";

  saveSettingsPseudo(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PSEUDO_KEY, value);
  }

  Future<String?> getSettingsPseudo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(PSEUDO_KEY);
  }

  saveSettingsEssais(String pseudo, String nbEssais, String level) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> essais = sharedPreferences.getStringList(ESSAIS_KEY) ?? [];
    essais.add("$pseudo:$nbEssais:$level");
    sharedPreferences.setStringList(ESSAIS_KEY, essais);
  }

  clearSettingsEssais() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(ESSAIS_KEY);
  }

  Future<List<String>> getSettingsEssais() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(ESSAIS_KEY) ?? [];
  }

  saveSettingsNiveau(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(NIVEAU_KEY, value);
  }

  saveSettingsNiveauJeu(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(NIVEAUJEU_KEY, value);
  }

  Future<int> getSettingsNiveau() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(NIVEAU_KEY) ?? 1;
  }

  Future<int> getSettingsNiveauJeu() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(NIVEAUJEU_KEY) ?? 1;
  }

  clearSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
