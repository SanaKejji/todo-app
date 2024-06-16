import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/di/injection.dart';
import 'package:todo_app/core/widgets/fancy_background.dart';
import 'package:todo_app/presentation/base/bloc/base_cubit.dart';
import 'package:todo_app/router/router.gr.dart';

import '../../core/theme/app_colors.dart';

@RoutePage()
class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
  final _bloc = getIt<BaseCubit>();
  @override
  void initState() {
    super.initState();
    _bloc.getUserMainInfo();
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
        return FancyBackground(
          page: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: child,
            bottomNavigationBar: buildBottomNavigation(context, tabsRouter),
          ),
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
