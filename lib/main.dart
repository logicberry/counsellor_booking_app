import 'package:counsellor/features/authentication/screens/screens.dart';
import 'package:counsellor/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
      //   DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(),
      // ));
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (ctx, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              // locale: DevicePreview.locale(context),
              // builder: DevicePreview.appBuilder,
              title: 'Counsellor',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.theme,
              onGenerateRoute: (settings) => generateRoute(settings),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
