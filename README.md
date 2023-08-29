# Expire It Flutter App

Expire It is a unique Flutter app designed to provide an expiration mechanism for applications. This app ensures that the target app becomes inaccessible after a specified date and time, preventing unauthorized usage beyond the intended period. Unlike other methods that rely on local device time changes, Expire It sources its expiration information from an online server, making it highly secure and tamper-resistant.

## Features

- **Secure Expiration:** Expire It utilizes an online server to fetch expiration date and time, ensuring that unauthorized access attempts through local time changes are ineffective.

- **Reliable Server:** The expiration information is stored on a reliable online server, making it virtually impossible to manipulate the expiration date and time locally.

- **Easy Integration:** Integration of the Expire It feature into your Flutter app is straightforward and hassle-free.

- **Customizable UI:** The UI of the Expire It dialog can be customized to seamlessly blend with the design of your app.

## How It Works

1. **Integration:** To integrate ExpireIt into your Flutter app, follow the provided guidelines to add the necessary code and UI elements.

2. **Server Communication:** The ExpireIt app communicates with an online server to fetch the expiration date and time of the target app.

3. **Expiration Dialog:** When the specified expiration date and time are reached, ExpireIt will display a dialog within the target app, informing the user that the app has expired and access is no longer available.

## Getting Started

To integrate the ExpireIt functionality into your Flutter app, follow these steps:

1. **Add Dependency:** Add the ExpireIt package as a dependency in your `pubspec.yaml` file:

   ```yaml
   dependencies:
     expireit: ^0.2.0
   ```

2. **Import the Package:** Import the ExpireIt package in your Dart file:

    ```dart
    import 'package:expireit/expireit.dart';
    ```

3. **Initialize:** Initialize the ExpireIt.controller with a specific expiration date. In this example, we use a UserDefineExpireController:

    ```dart
    void main() {
        ExpireIt.controller = UserDefineExpireController(expiryDate: DateTime(2023));
        runApp(const MyApp());
    }
    ```

4. **Build UI:** In your Flutter app's build method, utilize the ExpireIt widget to manage the UI based on expiration status:

    ```dart
    ExpireIt(
        expireBuilder: (context) {
            return const Center(
                child: Text("Expired"),
            );
        },
        builder: (context) {
            return const Center(
                child: Text("Home screen"),
            );
        },
        loadingBuilder: (context) {
            return const Center(
                child: CircularProgressIndicator(),
            );
        },
    ),
    ```
5. **Customize UI**: Customize the appearance of the expiration dialog and loading indicator to match your app's design.

For a more detailed guide and advanced configuration options, please refer to the ExpireIt documentation.

## Compatibility

Requires Flutter version 2.0.0 or higher.

## License

ExpireIt is released under the MIT License.

ExpireIt is designed to offer a robust and secure expiration mechanism for Flutter apps, safeguarding your app's usage beyond specified dates and times. If you have any questions, concerns, or feedback, feel free to contact us at raysummee@gmail.com. We are excited to see how ExpireIt enhances the security of your apps!