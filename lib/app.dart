import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:todo_app/router/router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/di/injection.dart';
import 'core/theme/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return ThemeProvider(
      defaultThemeId: "dark_theme",
      saveThemesOnChange: true,
      themes: [
        AppTheme(
          id: "light_theme",
          description: "Light Theme",
          data: CustomAppTheme.instance.lightTheme(context),
        ),
        AppTheme(
            id: "dark_theme",
            description: "dark Theme 2",
            data: CustomAppTheme.instance.darkTheme(context)),
      ],
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        }
      },
      child: ThemeConsumer(
        child: Builder(builder: (themeContext) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.themeOf(themeContext).data,
            routerDelegate: getIt<AppRouter>().delegate(
                navigatorObservers: () => [BotToastNavigatorObserver()]),
            routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
            builder: (context, child) {
              return ResponsiveBreakpoints.builder(
                child: botToastBuilder(context, child),
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                      start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
