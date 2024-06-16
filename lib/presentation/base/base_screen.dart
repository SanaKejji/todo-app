import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/router/router.gr.dart';

import '../../core/theme/app_colors.dart';

@RoutePage()
class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MyTodosRoute(),
        OthersTodosRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
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
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: child,
              bottomNavigationBar: buildBottomNavigation(context, tabsRouter),
            )
          ],
        );
      },
    );
  }

  Widget buildBottomNavigation(BuildContext context, TabsRouter tabsRouter) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
      },
      selectedItemColor: AppColors.secondary,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      unselectedLabelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(),
      selectedLabelStyle: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          label: 'My todos',
          icon: Icon(Icons.task_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Others todos',
          icon: Icon(Icons.groups),
        ),
      ],
    );
  }
}
