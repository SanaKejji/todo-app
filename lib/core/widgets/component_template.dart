import 'package:flutter/material.dart';

import '../utils/bot_toast_utils.dart';

enum ComponentStatus { fetchingData, showData, error, emptyData }

class ComponentTemplate extends StatelessWidget {
  final ComponentStatus state;
  final Widget Function(BuildContext) screen;
  final Widget? emptyScreen;
  final Widget? errorScreen;
  final String? errorMessage;
  final Widget? loadingScreen;
  final VoidCallback? onRetry;

  const ComponentTemplate(
      {super.key,
      required this.state,
      required this.screen,
      this.onRetry,
      this.emptyScreen,
      this.loadingScreen,
      this.errorScreen,
      this.errorMessage});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ComponentStatus.showData:
        return screen(context);
      case ComponentStatus.fetchingData:
        return Center(
          child: loadingScreen ?? const Loader(),
        );
      case ComponentStatus.emptyData:
        return emptyScreen ?? const Center(child: Text('No Items'));
      case ComponentStatus.error:
        return errorScreen ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(errorMessage ?? 'UnKnown Error'),
                      const SizedBox(height: 20),
                      if (onRetry != null)
                        OutlinedButton.icon(
                            onPressed: onRetry,
                            icon: const Icon(Icons.refresh),
                            label: const Text('retry'))
                    ]),
              ],
            );
      default:
        return Container();
    }
  }
}
