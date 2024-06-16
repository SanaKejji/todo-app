import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {super.key, required this.title, required this.confirmationMessage});
  final String title;
  final String confirmationMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: AppColors.bgDark, fontWeight: FontWeight.bold),
      ),
      content: Text(confirmationMessage),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text('Ok')),
        TextButton(
          style: TextButton.styleFrom(
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.primary)),
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
