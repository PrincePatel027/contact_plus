import 'dart:math';

import 'package:contact_plus/custom_widgets/edit_contact.dart';
import 'package:contact_plus/custom_widgets/height_width.dart';
import 'package:contact_plus/provider/phone_contact_provider.dart';
import 'package:contact_plus/provider/stepper_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneContactSelector extends StatefulWidget {
  const PhoneContactSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhoneContactSelectorState createState() => _PhoneContactSelectorState();
}

class _PhoneContactSelectorState extends State<PhoneContactSelector> {
  final random = Random();
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.cyan,
    Colors.amber,
    Colors.pink,
    Colors.lime,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.deepOrange,
  ];

  Color getRandomColor() {
    return colors[random.nextInt(colors.length)];
  }

  void makePhoneCall(String phoneNumber) async {
    // ignore: deprecated_member_use
    if (await canLaunch('tel:$phoneNumber')) {
      // ignore: deprecated_member_use
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch tel:$phoneNumber';
    }
  }

  void sendSMS(String phoneNumber) async {
    // ignore: deprecated_member_use
    if (await canLaunch('sms:$phoneNumber')) {
      // ignore: deprecated_member_use
      await launch('sms:$phoneNumber');
    } else {
      throw 'Could not launch tel:$phoneNumber';
    }
  }

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Search bar
          Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, bottom: 18, top: 18),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Search contacts...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<PhoneOrContact>(context, listen: false)
                        .phoneSelected();
                  },
                  child: Text(
                    "Phone",
                    style: TextStyle(
                      fontSize: 18,
                      color: (Provider.of<PhoneOrContact>(context, listen: true)
                              .selected
                              .isPhone)
                          ? Colors.blueAccent
                          : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<PhoneOrContact>(context, listen: false)
                      .contactSelected();
                },
                child: Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 18,
                    color: (Provider.of<PhoneOrContact>(context, listen: true)
                            .selected
                            .isPhone)
                        ? Colors.black
                        : Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          (Provider.of<PhoneOrContact>(context, listen: true)
                      .selected
                      .isPhone ==
                  false)
              ? Container(
                  height: heightFS(context) / 1.4,
                  alignment: Alignment.center,
                  child: (Provider.of<StepperProvider>(context)
                          .contacts
                          .isEmpty)
                      ? const Text(
                          "No Contact Available\n+ to add new contact",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: Provider.of<StepperProvider>(context)
                                .contacts
                                .where((contact) =>
                                    contact['name']!
                                        .toLowerCase()
                                        .contains(_searchQuery.toLowerCase()) ||
                                    contact['contact']!
                                        .toLowerCase()
                                        .contains(_searchQuery.toLowerCase()))
                                .length,
                            itemBuilder: (context, index) {
                              final filteredContacts =
                                  Provider.of<StepperProvider>(context)
                                      .contacts
                                      .where((contact) =>
                                          contact['name']!
                                              .toLowerCase()
                                              .contains(
                                                  _searchQuery.toLowerCase()) ||
                                          contact['contact']!
                                              .toLowerCase()
                                              .contains(
                                                  _searchQuery.toLowerCase()))
                                      .toList();
                              final e = filteredContacts[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                elevation: 4,
                                child: Slidable(
                                  startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                        ),
                                        flex: 2,
                                        onPressed: (context) {
                                          sendSMS("${e['contact']}");
                                        },
                                        backgroundColor:
                                            const Color(0xFF7BC043),
                                        foregroundColor: Colors.white,
                                        icon: Icons.sms,
                                        label: 'SMS',
                                      ),
                                    ],
                                  ),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                        ),
                                        flex: 2,
                                        onPressed: (context) {
                                          Provider.of<StepperProvider>(context,
                                                  listen: false)
                                              .hideContact(index);
                                        },
                                        backgroundColor:
                                            const Color(0xFF7BC043),
                                        foregroundColor: Colors.white,
                                        icon: Icons.archive,
                                        label: 'Hide',
                                      ),
                                      SlidableAction(
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                          right: Radius.circular(10),
                                        ),
                                        flex: 2,
                                        onPressed: (context) {
                                          editContact(context, index);
                                        },
                                        backgroundColor:
                                            const Color(0xFF4366C0),
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                        label: 'Edit',
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: getRandomColor(),
                                      child: Text(
                                        e['name']
                                            .toString()
                                            .characters
                                            .first
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    title: Text("${e['name']}"),
                                    subtitle: Text("${e['contact']}"),
                                    trailing: IconButton(
                                      onPressed: () {
                                        makePhoneCall("${e['contact']}");
                                      },
                                      icon: const Icon(
                                        Icons.call,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                )
              : Container(
                  height: heightFS(context) / 1.1 - 120,
                  alignment: Alignment.center,
                  child: const Text(
                    "No Phones",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
