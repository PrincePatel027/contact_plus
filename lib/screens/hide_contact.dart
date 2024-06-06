import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:contact_plus/provider/stepper_provider.dart';

class HiddenContactsScreen extends StatelessWidget {
  const HiddenContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hidden Contacts'),
      ),
      body: Consumer<StepperProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.hiddenContacts.length,
            itemBuilder: (context, index) {
              final contact = provider.hiddenContacts[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 4,
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10),
                        ),
                        flex: 2,
                        onPressed: (context) {
                          Provider.of<StepperProvider>(context, listen: false)
                              .unhideContact(index);
                        },
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Unhide',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        Provider.of<StepperProvider>(context, listen: false)
                            .hiddenContacts[index]['name']
                            .toString()
                            .characters
                            .first
                            .toUpperCase(),
                      ),
                    ),
                    title: Text(contact['name']!),
                    subtitle: Text(contact['contact']!),
                    trailing: const Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
