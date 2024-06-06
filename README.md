# Contact Plus

Contact Plus is a Flutter application designed to manage contacts efficiently. This project includes custom widgets, models, providers, and screens to provide a seamless user experience.

## Features

- **Custom Widgets**: A variety of custom widgets are used to build the UI components, such as app bars, drawers, steppers, and more.
- **Model**: Contains the data models used in the application.
- **Provider**: Uses the Provider package for state management.
- **Screens**: Multiple screens to navigate through different parts of the application.

## Photos & Videos

![Shot](https://github.com/PrincePatel027/contact_plus/assets/149999800/2f1a7205-d587-4f42-8df1-31969ad45575)



## Directory Structure

    lib
    ├── custom_widgets
    │   ├── app_bar.dart
    │   ├── custom_drawer.dart
    │   ├── custom_stapper.dart
    │   ├── dial_pad_bottom_sheet.dart
    │   ├── edit_contact.dart
    │   ├── height_width.dart
    │   ├── phone_contact_selector.dart
    │   └── text_styles.dart
    ├── model
    │   ├── contact_details.dart
    │   └── phone_or_contact.dart
    ├── provider
    │   ├── dialpad_provider.dart
    │   ├── phone_contact_provider.dart
    │   └── stepper_provider.dart
    └── screens
        ├── phone
        │   ├── phonescreen.dart
        │   ├── hide_contact.dart
        │   ├── home_page.dart
        │   └── splash_screen.dart
        └── main.dart

## How to Navigate

The main.dart file sets up the navigation and state management for the application. The MultiProvider is used to manage the state using the ChangeNotifierProvider for PhoneOrContact and StepperProvider.

## Routes

- splash : Displays the splash screen (Splash).
- "/" : Navigates to the home page (HomePage).
- hide : Navigates to the hidden contacts screen (HiddenContactsScreen).

## Providers

- PhoneOrContact: Manages the state for phone or contact operations.
- StepperProvider: Manages the state for stepper operations.

## Getting Started

To get started with this project, follow these steps:

## Getting Started

To get started with this project, follow these steps:

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/contact_plus.git

1. **Navigate to the project directory**:
   ```sh
   cd contact_plus

1. **Install the dependencies**:
   ```sh
   flutter pub get

1. **Run the application**:
   ```sh
   flutter run
