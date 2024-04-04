import 'package:flutter/material.dart';
import 'package:tp_note/views/accueil.dart';
import 'package:tp_note/mytheme.dart';
import 'package:tp_note/repository/settingsModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyTD2());
}

class MyTD2 extends StatelessWidget {
  const MyTD2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          SettingsViewModel settingViewModel = SettingsViewModel();
          return settingViewModel;
        }),
      ],
      child: Consumer<SettingsViewModel>(
        builder: (context, SettingsViewModel notifier, child) {
          return MaterialApp(
              theme: MyTheme.dark(),
              title: 'TP MOBILE',
              home: const Accueil());
        },
      ),
    );
  }
}
