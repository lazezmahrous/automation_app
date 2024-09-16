import 'package:automation_app/core/routing/routers.dart';
import 'package:automation_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

class AutomationApp extends StatefulWidget {
  AutomationApp({super.key, required this.appRouter});

  AppRouter appRouter;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<AutomationApp> createState() => _AutomationAppState();
}

class _AutomationAppState extends State<AutomationApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Cairo',
          primaryColor: ColorsManager.mainBlue,
        ),
        // locale: value.language,
        // localizationsDelegates: const [
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: widget.appRouter.generateRoute,
      ),
    );
  }
}
