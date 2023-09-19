import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../services/auth_services.dart';

enum ConfirmAction { cancel, accept }

final AuthServices authServices = AuthServices();

class LogoutDialogBox {
  static Future<ConfirmAction?> asyncConfirmDialog(
      {required BuildContext context, required String sessionID}) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/caution.png',
                scale: 5,
              ),
              const Text(
                'Are you sure?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'You want to logout of the system?',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(kPrimaryColor.withOpacity(0.1)),
                foregroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.cancel);
              },
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white)),
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.accept);
                authServices.logout(sessionId: sessionID);
              },
            )
          ],
        );
      },
    );
  }
}
