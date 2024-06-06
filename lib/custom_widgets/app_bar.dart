import 'package:contact_plus/custom_widgets/custom_stapper.dart';
import 'package:contact_plus/custom_widgets/height_width.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black12,
      width: widthFS(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(left: widthFS(context) / 30),
          //   child: IconButton(
          //     onPressed: () {
          //       Scaffold.of(context).openDrawer();
          //     },
          //     icon: const Icon(
          //       Icons.menu,
          //       color: Colors.blueAccent,
          //       size: 28,
          //     ),
          //   ),
          // ),
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
    );
  }
}
