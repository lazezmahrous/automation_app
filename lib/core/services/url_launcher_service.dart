import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:automation_app/core/services/notifcations.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  } 

  static Future<void> scheduleCall(String phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('scheduledPhoneNumber', phoneNumber);
    final int alarmId = 0;
    await AndroidAlarmManager.oneShot(
      const Duration(seconds: 2),
      alarmId,
      showNotification,
      exact: true,
      wakeup: true,
    );
  }

  static Future<void> showNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? scheduledPhoneNumber = prefs.getString('scheduledPhoneNumber');
    await NotificationService.showScheduleNotification(
      id: 0,
      title: 'جدولة مكالمة',
      body: 'اضغط لإجراء المكالمة',
      chanelKay: 'user_notifications',
      payload: {"phoneNumber": scheduledPhoneNumber!},
    );
  }


}
