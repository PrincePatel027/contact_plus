import 'package:contact_plus/custom_widgets/height_width.dart';
import 'package:flutter/material.dart';

class DialPad extends StatelessWidget {
  const DialPad({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightFS(context) / 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: widthFS(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Text(
                  //     // context.watch<DialPadProvider>().number,
                  //     // style: const TextStyle(fontSize: 24),
                  //     ),
                  SizedBox(
                    width: widthFS(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              // Provider.of<DialPadProvider>(context,
                              //         listen: false)
                              // .clear();
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                String text;
                if (index < 9) {
                  text = '${index + 1}';
                } else if (index == 9) {
                  text = '*';
                } else if (index == 10) {
                  text = '0';
                } else {
                  text = '#';
                }
                return GestureDetector(
                  onTap: () {
                    // Provider.of<DialPadProvider>(context, listen: false)
                    //     .addDigit(text);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 60,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.dialpad,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Steppper(context);
                  },
                  icon: const Icon(
                    Icons.save,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Provider.of<DialPadProvider>(context, listen: false)
                    //     .backspace();
                  },
                  icon: const Icon(
                    Icons.backspace,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
