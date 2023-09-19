import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'components/logout_dialog.dart';
import 'components/settings_item.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    getSession();
    super.initState();
  }

  String? sessionID;

  getSession() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();
    setState(() {
      sessionID = localStorage.getString('sessionId');
    });
  }

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
                LogoutDialogBox.asyncConfirmDialog(
                    context: context, sessionID: sessionID!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
