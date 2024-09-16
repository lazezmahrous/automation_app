import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:automation_app/automation_app.dart';
import 'package:automation_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/services/notifcations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await AndroidAlarmManager.initialize();
  await NotificationService.initializeNotification();
  runApp(AutomationApp(
    appRouter: AppRouter(),
  ));
}
