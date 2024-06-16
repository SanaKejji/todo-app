import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class FancyBackground extends StatelessWidget {
  const FancyBackground({Key? key, required this.page}) : super(key: key);
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Theme.of(context).scaffoldBackgroundColor),
        Positioned(
          top: 0,
          left: 250,
          child: Container(
            height: 260,
            width: 260,
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
