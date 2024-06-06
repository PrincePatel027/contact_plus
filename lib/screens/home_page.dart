import 'package:contact_plus/custom_widgets/custom_drawer.dart';
import 'package:contact_plus/custom_widgets/custom_stapper.dart';
import 'package:contact_plus/custom_widgets/dial_pad_bottom_sheet.dart';
import 'package:contact_plus/custom_widgets/height_width.dart';
import 'package:contact_plus/custom_widgets/phone_contact_selector.dart';
import 'package:contact_plus/provider/stepper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFFE89D88).withOpacity(0.5),
      //   actions: const [
      // CustomAppBar(),
      //   ],
      // ),
      body: Container(
        height: heightFS(context),
        width: widthFS(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background_light.png"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: heightFS(context) / 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: widthFS(context) / 30),
                    child: Builder(
                      builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.blueAccent,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: StepperDialog(),
                        ),
                      );
                      // const StepperDialog();
                    },
                    icon: Icon(
                      Icons.add,
                      size: heightFS(context) / 28,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            PhoneContactSelector(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blueAccent.shade100,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const DialPad(),
          );
        },
        child: const Icon(
          Icons.dialpad,
          color: Colors.white,
        ),
      ),
    );
  }
}
