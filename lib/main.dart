import 'package:flutter/material.dart';

import 'app/app_barrel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final theme = AppTheme();
  runApp(MaalfApp(appTheme: theme));
  generate();
}
