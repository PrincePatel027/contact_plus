import 'package:contact_plus/provider/phone_contact_provider.dart';
import 'package:contact_plus/provider/stepper_provider.dart';
import 'package:contact_plus/screens/hide_contact.dart';
import 'package:contact_plus/screens/home_page.dart';
import 'package:contact_plus/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhoneOrContact(),
        ),
        ChangeNotifierProvider(
          create: (context) => StepperProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "contactFont",
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        initialRoute: "splash",
        routes: {
          'splash': (context) => const Splash(),
          '/': (context) => const HomePage(),
          'hide': (context) => const HiddenContactsScreen(),
        },
      ),
    );
  }
}
