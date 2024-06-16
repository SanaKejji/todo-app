import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class FancyBackground extends StatelessWidget {
  const FancyBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Theme.of(context).scaffoldBackgroundColor),
        Positioned(
          top: 0,
          left: 250,
          child: Container(
            height: 450,
            width: 450,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 250,
                    spreadRadius: 5,
                    color: AppColors.primary.withOpacity(.5))
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          left: 270,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 250,
                    spreadRadius: 5,
                    color: AppColors.secondary.withOpacity(.5))
              ],
            ),
          ),
        ),
        Positioned(
          top: 300,
          right: 240,
          child: Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 250,
                    spreadRadius: 5,
                    color: AppColors.secondary.withOpacity(.4))
              ],
            ),
          ),
        ),
        page
      ],
    );
  }
}
