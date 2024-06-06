// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_plus/provider/stepper_provider.dart';
import 'package:contact_plus/custom_widgets/height_width.dart';

void editContact(BuildContext context, int index) {
  final provider = Provider.of<StepperProvider>(context, listen: false);
  final contact = provider.contacts[index];

  provider.nameController.text = contact['name']!;
  provider.contactController.text = contact['contact']!;
  provider.emailController.text = contact['email']!;

  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      height: heightFS(context) / 1,
      padding: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Edit Contact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 26),
            TextField(
              controller: provider.nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: provider.contactController,
              decoration: const InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: provider.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save the edited contact
                    provider.contacts[index] = {
                      'name': provider.nameController.text,
                      'contact': provider.contactController.text,
                      'email': provider.emailController.text,
                    };
                    // ignore: invalid_use_of_protected_member
                    provider.notifyListeners();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Cancel the edit
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
