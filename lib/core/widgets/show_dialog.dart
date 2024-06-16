import 'dart:async';
import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAppDialog(BuildContext context,
    {required Widget page, FutureOr Function(dynamic)? onDialogFinish}) async {
  return await showModal(
      useRootNavigator: false,
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 1000)),
      context: context,
      builder: (context) => page);
}
