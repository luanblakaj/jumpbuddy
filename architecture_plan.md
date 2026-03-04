# JumpBuddy App Overhaul: Architecture Plan

## 1. Introduction
This document outlines the architectural plan for the comprehensive overhaul of the JumpBuddy Flutter application. The goal is to modernize the app, enhance its functionality, improve user experience, and ensure it is built with current Flutter best practices. This plan addresses the user's requirements, including programmatic animations, science-backed exercises, API fixes, expanded exercise library, modernized UI/UX, and new premium features.

## 2. Core Architectural Principles
- **Clean Architecture**: Separation of concerns, making the app testable, maintainable, and scalable.
- **State Management**: Utilize `Provider` for simple state management and consider `Riverpod` or `Bloc` for more complex scenarios if needed, adhering to Flutter best practices.
- **Modularity**: Organize code into logical modules (e.g., `features`, `data`, `domain`, `presentation`).
- **Testability**: Design components to be easily testable with unit, widget, and integration tests.
- **Performance**: Optimize animations, data loading, and UI rendering for a smooth user experience.

## 3. Data Models and Modifications
Existing models (`Exercise`, `Gym`, `WorkoutCategory`) will be enhanced, and new models will be introduced to support expanded features.

### 3.1. `Exercise` Model Enhancements
```dart
class Exercise {
  final String id;
  final String name; // Trainer name or exercise variant name
  final String title;
  final String description; // Renamed from 'content' for clarity
  final String animationAsset; // Path to Rive/Lottie animation file or asset for CustomPainter
  final String? imageUrl; // Optional: for static images or thumbnails
  final String category;
  final List<String> tags; // e.g., 'beginner', 'advanced', 'bodyweight', 'equipment'
  final int durationSeconds; // For timed exercises
  final int repetitions; // For rep-based exercises
  final int sets; // Number of sets
  final String difficulty; // 'easy', 'medium', 'hard'
  final List<String> muscleGroups; // e.g., 'core', 'back', 'legs'
  final bool isFavorite;

  Exercise({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.animationAsset,
    this.imageUrl,
    required this.category,
    this.tags = const [],
    this.durationSeconds = 0,
    this.repetitions = 0,
    this.sets = 0,
    this.difficulty = 'medium',
    this.muscleGroups = const [],
    this.isFavorite = false,
  });

  // Add copyWith for immutability and easy state updates
  Exercise copyWith({
    String? id,
    String? name,
    String? title,
    String? description,
    String? animationAsset,
    String? imageUrl,
    String? category,
    List<String>? tags,
    int? durationSeconds,
    int? repetitions,
    int? sets,
    String? difficulty,
    List<String>? muscleGroups,
    bool? isFavorite,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
      animationAsset: animationAsset ?? this.animationAsset,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      repetitions: repetitions ?? this.repetitions,
      sets: sets ?? this.sets,
      difficulty: difficulty ?? this.difficulty,
      muscleGroups: muscleGroups ?? this.muscleGroups,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
```

### 3.2. New Models

#### `User` Model
```dart
class User {
  final String id;
  final String email;
  final String username;
  final String? profilePictureUrl;
  final List<String> favoriteExerciseIds;
  final List<WorkoutHistoryEntry> workoutHistory;
  final int workoutStreak;
  final double? bodyWeight;
  final DateTime? lastWeightUpdate;

  User({
    required this.id,
    required this.email,
    required this.username,
    this.profilePictureUrl,
    this.favoriteExerciseIds = const [],
    this.workoutHistory = const [],
    this.workoutStreak = 0,
    this.bodyWeight,
    this.lastWeightUpdate,
  });

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? profilePictureUrl,
    List<String>? favoriteExerciseIds,
    List<WorkoutHistoryEntry>? workoutHistory,
    int? workoutStreak,
    double? bodyWeight,
    DateTime? lastWeightUpdate,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      favoriteExerciseIds: favoriteExerciseIds ?? this.favoriteExerciseIds,
      workoutHistory: workoutHistory ?? this.workoutHistory,
      workoutStreak: workoutStreak ?? this.workoutStreak,
      bodyWeight: bodyWeight ?? this.bodyWeight,
      lastWeightUpdate: lastWeightUpdate ?? this.lastWeightUpdate,
    );
  }
}
```

#### `WorkoutHistoryEntry` Model
```dart
class WorkoutHistoryEntry {
  final String workoutId; // Could be a predefined workout or a custom one
  final DateTime date;
  final int durationMinutes;
  final List<CompletedExercise> completedExercises;

  WorkoutHistoryEntry({
    required this.workoutId,
    required this.date,
    required this.durationMinutes,
    this.completedExercises = const [],
  });
}
```

#### `CompletedExercise` Model
```dart
class CompletedExercise {
  final String exerciseId;
  final int setsCompleted;
  final int repsCompleted; // Or duration if timed
  final double? weightUsed; // If applicable

  CompletedExercise({
    required this.exerciseId,
    required this.setsCompleted,
    this.repsCompleted = 0,
    this.weightUsed,
  });
}
```

#### `Workout` Model (for predefined or custom workouts)
```dart
class Workout {
  final String id;
  final String title;
  final String description;
  final List<String> exerciseIds;
  final String category; // e.g., 'Full Body', 'Upper Body', 'Back Stabilization'
  final int estimatedDurationMinutes;
  final String difficulty;

  Workout({
    required this.id,
    required this.title,
    required this.description,
    required this.exerciseIds,
    required this.category,
    required this.estimatedDurationMinutes,
    required this.difficulty,
  });
}
```

## 4. Feature Implementation Plan

### 4.1. Programmatic Animations
- **Strategy**: Replace all GIF animations with Flutter's built-in animation framework, `Rive` animations, or `Lottie` animations. `Rive` is preferred for its performance and interactivity. `CustomPainter` will be used for simpler, custom animations.
- **Implementation**: Each `Exercise` will have an `animationAsset` field pointing to the appropriate animation file.

### 4.2. Back Stabilization Exercises
- **Data**: Integrate the researched McGill Big 3 exercises (Curl-up, Side Plank, Bird-Dog) and potentially Dead Bug and Pallof Press into the `Exercise` model with detailed descriptions and appropriate `muscleGroups` and `tags`.
- **Category**: Introduce a new `WorkoutCategory` for 
 exercises.
6. **Phase 6: Premium Features**: Develop workout timer, progress tracking, favorites, workout history, daily suggestions, and streaks.
7. **Phase 7: UI/UX Modernization**: Refine onboarding, implement smooth transitions, and apply the new design system.
8. **Phase 8: Integration & Testing**: Connect all features, perform thorough testing, and optimize performance.
9. **Phase 9: Deployment**: Commit and push changes to `branch_2026`.

## 7. References
[1] The McGill Big 3 Exercises for Core Stability. (2022). Northern Nevada Chiropractic. [https://northernnevadachiropractic.com/blog/back-pain-prevention/the-mcgill-big-3-exercises-for-core-stability/](https://northernnevadachiropractic.com/blog/back-pain-prevention/the-mcgill-big-3-exercises-for-core-stability/)
[2] The McGill Big 3 For Core Stability. (2018). Squat University. [https://squatuniversity.com/2018/06/21/the-mcgill-big-3-for-core-stability/](https://squatuniversity.com/2018/06/21/the-mcgill-big-3-for-core-stability/)
[3] Low Back Exercises: Stuart McGill’s Big Three. (2018). ACE Fitness. [https://www.acefitness.org/resources/pros/expert-articles/7077/low-back-exercises-stuart-mcgill-s-big-three/](https://www.acefitness.org/resources/pros/expert-articles/7077/low-back-exercises-stuart-mcgill-s-big-three/)
[4] Mastering the McGill Big Three: Progressions, Variations and Common Pitfalls. (2025). Backfitpro. [https://www.backfitpro.com/mastering-the-mcgill-big-three-progressions-variations-and-common-pitfalls/](https://www.backfitpro.com/mastering-the-mcgill-big-three-progressions-variations-and-common-pitfalls/)
[5] The Three Best Core Exercises for Back Pain: A Research-Backed Approach. (2025). CoSpineAndJoint. [https://cospineandjoint.com/the-three-best-core-exercises-for-back-pain-a-research-backed-approach/](https://cospineandjoint.com/the-three-best-core-exercises-for-back-pain-a-research-backed-approach/)
[6] Bird Dog Exercise: Benefits, Tips, & Variations. (2025). The Output by Peloton. [https://www.onepeloton.com/blog/bird-dog-exercise](https://www.onepeloton.com/blog/bird-dog-exercise)
[7] Fitness Trends 2026: What’s Next in Wellness, Tech & …. (2026). Golds Gym. [https://www.goldsgym.com/blog/2026-fitness-trends/](https://www.goldsgym.com/blog/2026-fitness-trends/)
[8] Fitness Trends 2026: Innovations and the Future of Fitness. (2026). The Be Kind People Project. [https://thebekindpeopleproject.org/blog/2026/01/14/fitness-trends-2026/](https://thebekindpeopleproject.org/blog/2026/01/14/fitness-trends-2026/)
[9] Flutter Animations: Implicit Widgets, Controllers & Hero Guide. (2025). Medium. [https://medium.com/easy-flutter/master-flutter-animations-the-essential-guide-to-implicit-controllers-and-hero-widgets-69102713a65d](https://medium.com/easy-flutter/master-flutter-animations-the-essential-guide-to-implicit-controllers-and-hero-widgets-69102713a65d)
[10] How to Create Flutter Animations: Complete Tutorial. (n.d.). Codecademy. [https://www.codecademy.com/article/how-to-create-flutter-animation](https://www.codecademy.com/article/how-to-create-flutter-animation)
Back Stabilization".

### 4.3. Expand Exercise Library
- **Content**: Add more exercises to existing categories (Warmup, Active/Strength, Stretch, Cooldown) and the new "Back Stabilization" category. Ensure detailed and helpful descriptions.
- **Data Source**: Exercises will be hardcoded initially within the app, similar to the current implementation, but with the enhanced `Exercise` model.

### 4.4. API and Account Functionality
- **Authentication**: Implement robust user authentication (signup, login, logout) using a secure backend service. Firebase Authentication or a custom backend with JWT will be considered.
- **API Calls**: Identify and replace broken/outdated APIs. For gym data, if the current API is not functional, a local dataset or a new free API will be integrated. For exercise data, it will be managed locally within the app for now.
- **User Data Storage**: Store user-specific data (favorites, workout history, progress) securely, likely using a cloud-based database (e.g., Firebase Firestore) or a local database (e.g., Hive, SQLite) for offline capabilities.

### 4.5. Modernize Design for 2026
- **UI/UX**: Redesign the entire app with a modern, clean, and premium aesthetic. This includes updated color schemes, typography, iconography, and spacing.
- **Onboarding Flow**: Create an engaging and informative onboarding experience for new users.
- **Animations & Transitions**: Implement smooth page transitions, hero animations, and subtle UI animations to enhance the user experience.
- **Responsive Design**: Ensure the app looks and functions well across various screen sizes and orientations.

### 4.6. Add More Functionality (Premium Features)
- **Workout Timer**: An interactive timer for exercises and rest periods, with customizable settings and audio cues.
- **Progress Tracking**: Allow users to log workout details (sets, reps, weight, duration) and visualize their progress over time through charts and graphs.
- **Exercise Favorites**: Enable users to mark exercises as favorites for quick access.
- **Workout History**: Maintain a detailed log of completed workouts, including exercises performed, duration, and date.
- **Daily Workout Suggestions**: Implement a basic recommendation system that suggests workouts based on user preferences, history, and available exercise categories.
- **Workout Streaks**: Gamify the experience by tracking consecutive workout days.
- **Body Weight Tracking**: Allow users to log and track their body weight over time.

## 5. Technology Stack and Best Practices
- **Flutter Version**: Utilize the latest stable Flutter version (currently `sdk: ^3.5.3` as per `pubspec.yaml`, will update to latest stable).
- **State Management**: `Provider` will be the primary state management solution, with potential for `Riverpod` if more complex global state is required.
- **Dependency Injection**: Use `get_it` or similar for service location and dependency injection.
- **Routing**: `go_router` for declarative and robust navigation.
- **Animations**: `flutter_animate` for declarative animations, `Rive` or `Lottie` for complex, programmatic animations, and `CustomPainter` for bespoke animations.
- **Local Storage**: `shared_preferences` for simple key-value pairs, `Hive` or `sqflite` for structured local data.
- **Network**: `http` or `dio` for API calls.
- **Linting**: Adhere to `flutter_lints` recommendations for clean and consistent code.

## 6. Development Phases
This project will be executed in the following phases:
1. **Phase 1: Clone & Analyze**: Initial setup and codebase review (Completed).
2. **Phase 2: Research**: Gather information on exercises, animations, and trends (Completed).
3. **Phase 3: Architecture**: Define models, features, and tech stack (Current).
4. **Phase 4: Core Infrastructure**: Set up theme, navigation, and initial data handling.
5. **Phase 5: Exercise Library**: Implement all exercise categories with programmatic animations.
6. **Phase 6: Premium Features**: Develop workout timer, progress tracking, favorites, workout history, daily suggestions, and streaks.
7. **Phase 7: UI/UX Modernization**: Refine onboarding, implement smooth transitions, and apply the new design system.
8. **Phase 8: Integration & Testing**: Connect all features, perform thorough testing, and optimize performance.
9. **Phase 9: Deployment**: Commit and push changes to `branch_2026`.

## 7. References
[1] The McGill Big 3 Exercises for Core Stability. (2022). Northern Nevada Chiropractic. [https://northernnevadachiropractic.com/blog/back-pain-prevention/the-mcgill-big-3-exercises-for-core-stability/](https://northernnevadachiropractic.com/blog/back-pain-prevention/the-mcgill-big-3-exercises-for-core-stability/)
[2] The McGill Big 3 For Core Stability. (2018). Squat University. [https://squatuniversity.com/2018/06/21/the-mcgill-big-3-for-core-stability/](https://squatuniversity.com/2018/06/21/the-mcgill-big-3-for-core-stability/)
[3] Low Back Exercises: Stuart McGill’s Big Three. (2018). ACE Fitness. [https://www.acefitness.org/resources/pros/expert-articles/7077/low-back-exercises-stuart-mcgill-s-big-three/](https://www.acefitness.org/resources/pros/expert-articles/7077/low-back-exercises-stuart-mcgill-s-big-three/)
[4] Mastering the McGill Big Three: Progressions, Variations and Common Pitfalls. (2025). Backfitpro. [https://www.backfitpro.com/mastering-the-mcgill-big-three-progressions-variations-and-common-pitfalls/](https://www.backfitpro.com/mastering-the-mcgill-big-three-progressions-variations-and-common-pitfalls/)
[5] The Three Best Core Exercises for Back Pain: A Research-Backed Approach. (2025). CoSpineAndJoint. [https://cospineandjoint.com/the-three-best-core-exercises-for-back-pain-a-research-backed-approach/](https://cospineandjoint.com/re-three-best-core-exercises-for-back-pain-a-research-backed-approach/)
[6] Bird Dog Exercise: Benefits, Tips, & Variations. (2025). The Output by Peloton. [https://www.onepeloton.com/blog/bird-dog-exercise](https://www.onepeloton.com/blog/bird-dog-exercise)
[7] Fitness Trends 2026: What’s Next in Wellness, Tech & …. (2026). Golds Gym. [https://www.goldsgym.com/blog/2026-fitness-trends/](https://www.goldsgym.com/blog/2026-fitness-trends/)
[8] Fitness Trends 2026: Innovations and the Future of Fitness. (2026). The Be Kind People Project. [https://thebekindpeopleproject.org/blog/2026/01/14/fitness-trends-2026/](https://thebekindpeopleproject.org/blog/2026/01/14/fitness-trends-2026/)
[9] Flutter Animations: Implicit Widgets, Controllers & Hero Guide. (2025). Medium. [https://medium.com/easy-flutter/master-flutter-animations-the-essential-guide-to-implicit-controllers-and-hero-widgets-69102713a65d](https://medium.com/easy-flutter/master-flutter-animations-the-essential-guide-to-implicit-controllers-and-hero-widgets-69102713a65d)
[10] How to Create Flutter Animations: Complete Tutorial. (n.d.). Codecademy. [https://www.codecademy.com/article/how-to-create-flutter-animation](https://www.codecademy.com/article/how-to-create-flutter-animation)
