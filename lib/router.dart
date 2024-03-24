import 'package:counsellor/features/authentication/screens/screens.dart';
import 'package:counsellor/features/home/screens/counsellors.dart';
import 'package:counsellor/features/home/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'core/core.dart';
import 'features/authentication/screens/welcome.dart';
import 'features/home/screens/counsellor_info_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const SplashScreen(),
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case WelcomeScreen.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const WelcomeScreen(),
        type: PageTransitionType.bottomToTop,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case SignInScreen.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const SignInScreen(),
        type: PageTransitionType.fade,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case SignUpScreen.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const SignUpScreen(),
        type: PageTransitionType.bottomToTop,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case OtpScreen.routeName:
      final args = routeSettings.arguments as OtpScreen;

      return PageTransition(
        settings: routeSettings,
        child: OtpScreen(
          email: args.email,
        ),
        type: PageTransitionType.fade,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case PatientProfileScreen.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const PatientProfileScreen(),
        type: PageTransitionType.bottomToTop,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case HomePage.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const HomePage(),
        type: PageTransitionType.fade,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case CounsellorsListPage.routeName:
      return PageTransition(
        settings: routeSettings,
        child: const CounsellorsListPage(),
        type: PageTransitionType.leftToRight,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );
    case CounsellorInfoPage.routeName:
      final args = routeSettings.arguments as CounsellorInfoPage;
      return PageTransition(
        settings: routeSettings,
        child: CounsellorInfoPage(
          name: args.name,
          title: args.title,
          about: args.about,
        ),
        type: PageTransitionType.scale,
        duration: const Duration(seconds: 1),
        alignment: Alignment.bottomCenter,
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(
              child: AppTheme.clText(
                  '404 - 😒', size: 20, _, fontWeight: FontWeight.w500)),
        ),
      );
  }
}
