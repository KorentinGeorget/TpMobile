import 'settingsRepository.dart';
import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  late String _pseudo;
  late List _nombreEssais;
  late int _niveau;
  late int _niveauJeu;
  late SettingsRepository _settingRepository;
  String get pseudo => _pseudo;
  List get nombreEssais => _nombreEssais;
  int get niveau => _niveau;
  int get niveauJeu => _niveauJeu;
  SettingsViewModel() {
    _nombreEssais = [];
    _niveau = 1;
    _niveauJeu = _niveau;
    _settingRepository = SettingsRepository();
    getSettingsPseudo();
    getSettingsEssais();
    getSettingsNiveau();
    getSettingsNiveauJeu();
  }


  set pseudo(String value) {
    _pseudo = value;
    _settingRepository.saveSettingsPseudo(value);
    notifyListeners();
  }

  

  addScore(String pseudo, String essais, String level) {
    _nombreEssais.add("$pseudo:$essais:$level");
    _settingRepository.saveSettingsEssais(pseudo, essais, level);
    notifyListeners();
  }

  clearScore() {
    _nombreEssais = [];
    _settingRepository.clearSettingsEssais();
    notifyListeners();
  }

  set niveau(int value) {
    _niveau = value;
    _settingRepository.saveSettingsNiveau(value);
    notifyListeners();
  }

  set niveauJeu(int value) {
    _niveauJeu = value;
    _settingRepository.saveSettingsNiveauJeu(value);
    notifyListeners();
  }

  getSettingsPseudo() async {
    _pseudo = await _settingRepository.getSettingsPseudo() ?? "";
    notifyListeners();
  }

  getSettingsEssais() async {
    _nombreEssais = await _settingRepository.getSettingsEssais();
    notifyListeners();
  }

  getSettingsNiveau() async {
    _niveau = await _settingRepository.getSettingsNiveau();
    notifyListeners();
  }

  getSettingsNiveauJeu() async {
    _niveauJeu = await _settingRepository.getSettingsNiveauJeu();
    if (_niveauJeu > _niveau) {
      _niveauJeu = _niveau;
      _settingRepository.saveSettingsNiveauJeu(_niveauJeu);
    }
    notifyListeners();
  }

  clearSettings() {
    _settingRepository.clearSettings();
    _pseudo = "";
    _nombreEssais = [];
    _niveau = 1;
    _niveauJeu = 1;
    notifyListeners();
  }

  clearSettingsScore() {
    _settingRepository.clearSettingsEssais();
    _nombreEssais = [];
    notifyListeners();
  }
}
