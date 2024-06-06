import 'dart:async';

import 'package:contact_plus/custom_widgets/height_width.dart';
import 'package:contact_plus/provider/stepper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final stepperProvider =
        Provider.of<StepperProvider>(context, listen: false);
    await stepperProvider.initialize();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: heightFS(context),
        width: widthFS(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_light.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset("assets/images/logo.png"),
            ),
            Text(
              "Contact Plus",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "All Your Contacts, All in One Place",
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
