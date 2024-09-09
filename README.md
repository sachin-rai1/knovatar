# knovatar

## Overview

This Flutter application uses the GetX state management solution to handle state and routing, alongside a few third-party libraries to enhance functionality. The app fetches data from an API, manages local storage, and updates the UI based on the visibility of items in a list.

## Architectural Choices

### GetX

**GetX** is used for state management, dependency injection, and routing in this application. It provides a simple and reactive approach to managing application state and makes the codebase more maintainable by reducing boilerplate.

- **State Management**: GetX allows for efficient state management with minimal code, using reactive variables and controllers.
- **Routing**: GetX provides straightforward routing capabilities, making it easy to navigate between different screens.
- **Dependency Injection**: GetX simplifies dependency management with its dependency injection system, making it easier to manage and inject services and controllers.

### Third-Party Libraries

1. **GetStorage** (`get_storage: ^2.1.1`)
    - **Purpose**: Used for local storage to persist data across app restarts.
    - **Usage**: Stores and retrieves data efficiently, ensuring that data remains available even when the app is closed and reopened.

2. **VisibilityDetector** (`visibility_detector: ^0.4.0+2`)
    - **Purpose**: Detects the visibility of widgets on the screen to manage timers and other UI elements based on their visibility.
    - **Usage**: Determines if a list item is visible on the screen, allowing timers to start or pause based on the item's visibility.

3. **Dio** (`dio: ^5.7.0`)
    - **Purpose**: A powerful HTTP client for making network requests.
    - **Usage**: Handles API requests and responses, providing features like interceptors, global configuration, and more.

4. **Get** (`get: 4.6.6`)
    - **Purpose**: Provides GetX functionalities for state management, routing, and dependency injection.
    - **Usage**: Used in conjunction with GetX for various app management tasks.

5. **Cupertino Icons** (`cupertino_icons: ^1.0.8`)
    - **Purpose**: Provides icons that follow Apple's design guidelines.
    - **Usage**: Used for UI elements that require Cupertino-styled icons.

## Setup and Running the Application

### Prerequisites

- Flutter SDK: Make sure you have Flutter installed on your machine. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) if needed.
- Dart SDK: Included with Flutter installation.

### Getting Started

1. **Clone the Repository**

   ```sh
   git clone https://github.com/sachin-rai1/knovatar.git
   cd your-repository
   ```

2. **Install Dependencies**

   Run the following command to get the required packages:

   ```sh
   flutter pub get
   ```

3. **Run the Application**

   You can run the application on an emulator or a physical device using:

   ```sh
   flutter run
   ```
