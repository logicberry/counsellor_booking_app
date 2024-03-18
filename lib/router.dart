import 'package:counsellor/features/authentication/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'core/core.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const SplashScreen(),
        type: PageTransitionType.rotate,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
       default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(
              child: AppTheme.gilroyText(
                  'Screen no dey 😒',
                  size: 20,
                  _,
                  fontWeight: FontWeight.w500)),
        ),
      );
  }
}
