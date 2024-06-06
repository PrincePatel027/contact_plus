import 'package:contact_plus/custom_widgets/height_width.dart';
import 'package:contact_plus/provider/stepper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepperDialog extends StatefulWidget {
  const StepperDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StepperDialogState createState() => _StepperDialogState();
}

class _StepperDialogState extends State<StepperDialog> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StepperProvider>(context);
    GlobalKey<FormState> key = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: SizedBox(
        width: widthFS(context),
        child: Form(
          key: key,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < 2) {
                setState(() {
                  _currentStep++;
                });
              } else {
                if (key.currentState!.validate()) {
                  provider.save();
                  provider.clean();
                  provider.contactController.clear();
                  provider.emailController.clear();
                  provider.emailController.clear();
                  Navigator.of(context).pop();
                }
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            steps: [
              Step(
                title: const Text('Name'),
                content: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  controller: provider.nameController,
                  decoration:
                      const InputDecoration(labelText: 'Enter your name'),
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep > 0 ? StepState.complete : StepState.indexed,
              ),
              Step(
                title: const Text('Contact Number'),
                content: TextFormField(
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a contact number';
                    }
                    return null;
                  },
                  controller: provider.contactController,
                  decoration: const InputDecoration(
                      labelText: 'Enter your contact number'),
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep > 1 ? StepState.complete : StepState.indexed,
              ),
              Step(
                title: const Text('Email'),
                content: TextFormField(
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: provider.emailController,
                  decoration:
                      const InputDecoration(labelText: 'Enter your email'),
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep == 2 ? StepState.indexed : StepState.complete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
