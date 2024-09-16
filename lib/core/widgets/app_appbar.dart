import 'package:flutter/material.dart';

import 'app_back_button.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const AppBackButton(),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
