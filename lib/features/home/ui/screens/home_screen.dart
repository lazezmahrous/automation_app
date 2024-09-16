import 'package:automation_app/core/helpers/spacing.dart';
import 'package:automation_app/core/widgets/app_gradient_button.dart';
import 'package:automation_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/services/url_launcher_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String number = '';
  
  Future<void> requestExactAlarmPermission() async {
    if (await Permission.scheduleExactAlarm.isDenied) {
      await openAppSettings();
    }
  }

  @override
  void initState() {
    requestExactAlarmPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        children: [
          AppTextFormField(
            hintText: 'number',
            onChanged: (data) {
              number = data;
            },
          ),
          verticalSpace(10),
          AppGradientButton(
            size: Size(100.w, 30.h),
            text: 'text',
            onPressed: () async {
              UrlLauncherService.makePhoneCall(number.trim());
            },
          ),
          AppGradientButton(
            size: Size(100.w, 30.h),
            text: 'scheduale',
            onPressed: () async {
              UrlLauncherService.scheduleCall(number.trim());
            },
          ),
        ],
      ),
    );
  }
}
