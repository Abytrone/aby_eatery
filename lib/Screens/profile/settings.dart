import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../services/auth_services.dart';
import 'components/settings_item.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SettingsItem(
              icon: 'assets/icons/user_gradient.svg',
              text: 'Personal Info',
              color: Colors.green,
            ),
            const SettingsItem(
              icon: 'assets/icons/notification_gradient.svg',
              text: 'Notifications',
              color: Colors.amber,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 1, color: kDarkColor.withOpacity(0.2)),
            ),
            const SettingsItem(
              icon: 'assets/icons/clipboard_text_gradient.svg',
              text: 'Help Center',
              color: Colors.blue,
            ),
            const SettingsItem(
              icon: 'assets/icons/info_circle_gradient.svg',
              text: 'About Abyeatery',
              color: Colors.indigo,
            ),
            SettingsItem(
              icon: 'assets/icons/logout_gradient.svg',
              text: 'Logout',
              color: kErrorColor,
              onTap: () {
                authServices.logout(
                    sessionId: authServices.box.read('sessionId'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
