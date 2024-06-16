import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injection.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureInjection();
      EquatableConfig.stringify = true;
      runApp(const App());
    },
    (error, stack) {},
  );
}
