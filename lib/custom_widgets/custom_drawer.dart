import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalAuthentication localAuthentication = LocalAuthentication();

    Future<void> lockScreen(BuildContext context) async {
      bool authenticated = false;

      try {
        authenticated = await localAuthentication.authenticate(
          localizedReason: 'Hide Contacts',
        );
      } catch (e) {
        // ignore: avoid_print
        print('Error: $e');
      }

      if (authenticated) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, "hide");
      }
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Contact Plus'),
          ),
          ListTile(
            title: const Text('Hide Contacts'),
            onTap: () {
              lockScreen(context);
            },
          ),
        ],
      ),
    );
  }
}
