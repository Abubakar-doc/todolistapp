## To-Do App

A simple to-do app built with Flutter that operates on both Android and web platforms. This app allows users to add, view, and delete tasks. The tasks are persisted using in-memory storage.

## Features

1. **Cross-Platform:** Supports both Android and web.
2. **Dark and Light Themes:** Choose between dark and light themes for better user experience.
3. **Add Tasks:** Easily add new tasks with a simple form.
4. **View Tasks:** Displays a list of all added tasks.
5. **Delete Tasks:** Remove tasks with a single click or by a swipe to the left.
6. **Persistent Storage:** Keeps tasks across app restarts using in-memory storage.

## UI Design

### Home Screen

- **Display a List of To-Do Items:** Shows all the tasks with their descriptions.
- **Delete Button for Each Item:** Allows for easy removal of tasks.
- **Theme Switching:** Allows users to switch between dark and light themes for a customized look and feel.

### Add Task Screen

- **Simple Form:** Contains a text input for adding a new task.
- **Save Button:** Saves the task and navigates back to the home screen where the new task is displayed.

## Dark and Light Themes

This app supports both dark and light themes, providing a visually pleasing experience regardless of the user's preferences or lighting conditions. Here's how it works:

1. **Manual Theme Switching:**
    - Users can manually switch between dark and light themes within the app settings, providing flexibility for different preferences and environments.

2. **Consistent UI:**
    - Both themes are designed to ensure readability and usability, with appropriate contrast and color schemes for each theme.

3. **Theme Persistence:**
    - The selected theme preference is saved and persisted across app restarts, ensuring that users don't have to reselect their preferred theme each time they open the app.

## Functionality

### Add Task

1. **Navigate from Home Screen to Add Task Screen:** Use the app's navigation to move to the Add Task screen.
2. **Enter Task Description and Save It:** Input the task description in the provided text field and press the save button.
3. **Task Appears on Home Screen:** After saving, the new task is added to the list of tasks on the home screen.

### View Tasks

- **Display List of All Added Tasks:** All tasks are displayed on the home screen.
- **Persist Tasks Across App Restarts:** Tasks are stored in memory and are persistent across app restarts.

### Delete Task

- **Remove Task from List:** Each task has a delete button which, when pressed, removes the task from the list.

## Dependencies

The following dependencies are used in this project:

- **[flutter_styled_toast: ^2.2.1](https://pub.dev/packages/flutter_styled_toast)**: A Flutter plugin for customizable toast messages.
- **[provider: ^6.1.2](https://pub.dev/packages/provider)**: A state management plugin for managing app state.
- **[shared_preferences: ^2.2.3](https://pub.dev/packages/shared_preferences)**: A Flutter plugin for storing simple key-value pairs.
- **[hive: ^2.2.3](https://pub.dev/packages/hive)**: A lightweight and blazing fast key-value database written in pure Dart.
- **[hive_flutter: ^1.1.0](https://pub.dev/packages/hive_flutter)**: Provides extensions to easily use Hive with Flutter.
- **[build_runner: ^2.4.11](https://pub.dev/packages/build_runner)**: A tool to generate files in Dart.
- **[path_provider: ^2.1.3](https://pub.dev/packages/path_provider)**: A Flutter plugin for finding commonly used locations on the filesystem.
- **[hive_generator: ^2.0.1](https://pub.dev/packages/hive_generator)**: Generates TypeAdapters for use with Hive.

## Installation

To get started with the to-do app, follow these steps:

1. **Clone the Repository:**
    ```sh
    git clone https://github.com/Abubakar-doc/todolistapp.git
    cd flutter-todo-app
    ```

2. **Install Dependencies:**
    ```sh
    flutter pub get
    ```

3. **Run the App:**
    ```sh
    flutter run
    ```

## Screenshots

### Light Theme

![IMG_20240703_184035](https://github.com/Abubakar-doc/todolistapp/assets/137390804/82f4bd5a-3bac-4774-b7b1-c44a42beb9fd)


The light theme offers a clean and bright interface suitable for well-lit conditions. The theme can be switched from the settings menu, and the preference is saved for future sessions.

### Dark Theme

![IMG_20240703_184053](https://github.com/Abubakar-doc/todolistapp/assets/137390804/1a7c199d-9c88-48e9-a2c0-40a4a64e1add)


The app also supports a dark theme, which can be enabled from the settings. The dark theme provides a pleasant experience in low-light environments and reduces eye strain.


---
