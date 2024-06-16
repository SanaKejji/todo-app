import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/core/theme/theme.dart';
import 'package:todo_app/data/models/auth/user.dart';

import '../../core/theme/app_colors.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog(
      {Key? key, required this.user, required this.onLogout, required this.onChangeTheme})
      : super(key: key);
  final User user;
  final Function() onLogout;
  final Function() onChangeTheme;

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CustomAppTheme.instance.isLightTheme(context);
    return Dialog(
      // insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.image, scale: 1),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${user.firstName} ${user.lastName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${user.email}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Divider(),
                  StatefulBuilder(builder: (context, setState) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: AppColors.primary,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Light Theme',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.primary),
                          ),
                          Switch(
                              value: isLightTheme,
                              onChanged: (val) {
                                setState(() {
                                  isLightTheme = val;
                                  onChangeTheme.call();
                                });
                              }),
                        ],
                      ),
                    );
                  }),
                  TextButton.icon(
                      onPressed: () {
                        onLogout.call();
                      },
                      icon: Icon(Icons.logout),
                      label: Text('Logout'))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                style: TextButton.styleFrom(
                    textStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primary)),
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Cancel'),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
