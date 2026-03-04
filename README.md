# JumpBuddy

![JumpBuddy Logo](assets/img/logo_text.png)

## Description

JumpBuddy is a modern Flutter application designed to be your ultimate fitness companion. It provides a wide range of workout exercises, focusing on categories like warm-up, active/strength training, back stabilization, stretching, and cool-down. With JumpBuddy, users can track their progress, manage favorite exercises, and follow structured workout routines to achieve their fitness goals.

## Screenshots

*(Placeholder for app screenshots. Will be added soon!)*

## Features

JumpBuddy comes packed with features to enhance your fitness journey:

*   **Workout Categories:** Explore exercises organized into distinct categories such as Warmup, Active/Strength, Back Stabilization, Stretch, and Cooldown.
*   **Back Stabilization:** Access science-backed core and back stability exercises, including McGill Curl-Up, Side Plank, and Bird-Dog.
*   **Timer Functionality:** Integrated timers for duration-based exercises.
*   **Progress Tracking:** Monitor your workout history and track your achievements over time.
*   **Streaks:** Stay motivated with workout streaks, encouraging consistent exercise habits.
*   **Favorites:** Mark your preferred exercises for quick access and personalized routines.
*   **Workout History:** Review past workouts, including exercises performed, sets, repetitions, and durations.
*   **Gym Finder:** (If applicable, based on `app_provider.dart` content) Locate nearby gyms with detailed information.
*   **Onboarding Experience:** A guided introduction for new users to get started with the app.

## Tech Stack

*   **Framework:** Flutter
*   **Language:** Dart
*   **State Management:** Provider
*   **Font Management:** Google Fonts
*   **Local Storage:** shared_preferences

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have Flutter installed on your system. If not, follow the official Flutter installation guide:
[Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/luanblakaj/jumpbuddy.git
    ```
2.  Navigate to the project directory:
    ```bash
    cd jumpbuddy
    ```
3.  Checkout the `branch_2026` branch:
    ```bash
    git checkout branch_2026
    ```
4.  Install Flutter dependencies:
    ```bash
    flutter pub get
    ```
5.  Run the app:
    ```bash
    flutter run
    ```

## Project Structure

```
jumpbuddy/
├── lib/
│   ├── main.dart
│   ├── models/             # Data models for exercises, categories, etc.
│   ├── providers/          # State management with Provider
│   ├── screens/            # UI screens and pages
│   ├── services/           # Business logic and data fetching
│   └── theme/              # Application theme and color palette
├── assets/
│   ├── img/                # Images, animations, and logos
│   └── i18n/               # Internationalization files
├── pubspec.yaml            # Project dependencies and metadata
├── README.md               # Project README file
└── ... (other project files)
```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
