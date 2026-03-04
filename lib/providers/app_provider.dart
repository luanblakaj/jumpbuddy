import 'package:flutter/material.dart';
import '../models/app_models.dart';
import 'package:uuid/uuid.dart';

class AppProvider extends ChangeNotifier {
  List<Exercise> exercises = [];
  List<Gym> gyms = [];
  List<WorkoutCategory> categories = [];
  List<String> favoriteExerciseIds = [];
  List<WorkoutHistoryEntry> workoutHistory = [];
  int workoutStreak = 5; // Mock streak for UI
  double bodyWeight = 75.5; // Mock weight

  AppProvider() {
    _initializeData();
  }

  void _initializeData() {
    _initializeCategories();
    _initializeExercises();
    _initializeGyms();
    _initializeMockHistory();
  }

  void _initializeCategories() {
    categories = [
      WorkoutCategory(
        id: 'warmup',
        title: 'Warmup',
        image: 'assets/img/straight.jpg',
        description: 'Prepare your body for intense exercise',
      ),
      WorkoutCategory(
        id: 'active',
        title: 'Active/Strength',
        image: 'assets/img/weights.jpg',
        description: 'Build strength and power',
      ),
      WorkoutCategory(
        id: 'back_stabilization',
        title: 'Back Stabilization',
        image: 'assets/img/straight.jpg',
        description: 'Science-backed core and back stability exercises',
      ),
      WorkoutCategory(
        id: 'stretch',
        title: 'Stretch',
        image: 'assets/img/stretch.jpg',
        description: 'Improve flexibility and mobility',
      ),
      WorkoutCategory(
        id: 'cooldown',
        title: 'Cooldown',
        image: 'assets/img/cooldown.jpg',
        description: 'Recovery and relaxation',
      ),
    ];
  }

  void _initializeExercises() {
    final List<Exercise> allExercises = [];

    // WARMUP (6 exercises)
    final warmupData = [
      ['w1', 'Jumping Jacks', 'Full body cardio warm-up', 'assets/img/character_jump_grey.gif', 60, 0, 1, 'easy', 'Full Body'],
      ['w2', 'Arm Circles', 'Shoulder mobility', 'assets/img/straight.jpg', 30, 0, 1, 'easy', 'Shoulders'],
      ['w3', 'Leg Swings', 'Hip mobility', 'assets/img/straight.jpg', 30, 0, 1, 'easy', 'Hips'],
      ['w4', 'Cat-Cow', 'Spinal mobility', 'assets/img/straight.jpg', 60, 0, 1, 'easy', 'Back'],
      ['w5', 'High Knees', 'Cardio and hip flexors', 'assets/img/character_jump_grey.gif', 45, 0, 1, 'easy', 'Legs'],
      ['w6', 'Butt Kicks', 'Cardio and hamstrings', 'assets/img/character_jump_grey.gif', 45, 0, 1, 'easy', 'Legs'],
    ];

    for (var data in warmupData) {
      allExercises.add(Exercise(
        id: data[0] as String,
        name: 'Trainer Alex',
        title: data[1] as String,
        description: data[2] as String,
        animationAsset: data[3] as String,
        category: 'warmup',
        durationSeconds: data[4] as int,
        repetitions: data[5] as int,
        sets: data[6] as int,
        difficulty: data[7] as String,
        muscleGroups: [data[8] as String],
        instructions: 'Perform the movement steadily for the duration.',
      ));
    }

    // ACTIVE/STRENGTH (10 exercises)
    final strengthData = [
      ['s1', 'Push-Ups', 'Classic upper body strength', 'assets/img/pushups_animation.gif', 0, 15, 3, 'medium', 'Chest, Triceps'],
      ['s2', 'Squats', 'Lower body foundation', 'assets/img/squat_animation.gif', 0, 20, 3, 'medium', 'Quads, Glutes'],
      ['s3', 'Lunges', 'Unilateral leg strength', 'assets/img/character_lunges.gif', 0, 12, 3, 'medium', 'Legs'],
      ['s4', 'Plank', 'Core endurance', 'assets/img/straight.jpg', 60, 0, 3, 'medium', 'Core'],
      ['s5', 'Burpees', 'Full body explosive', 'assets/img/character_jump_grey.gif', 0, 10, 3, 'hard', 'Full Body'],
      ['s6', 'Mountain Climbers', 'Core and cardio', 'assets/img/straight.jpg', 45, 0, 3, 'medium', 'Core, Shoulders'],
      ['s7', 'Dips', 'Triceps focus', 'assets/img/straight.jpg', 0, 12, 3, 'medium', 'Triceps'],
      ['s8', 'Pull-Ups', 'Back and biceps', 'assets/img/straight.jpg', 0, 8, 3, 'hard', 'Back, Biceps'],
      ['s9', 'Diamond Push-Ups', 'Triceps emphasis', 'assets/img/pushups_animation.gif', 0, 10, 3, 'hard', 'Triceps, Chest'],
      ['s10', 'Pistol Squats', 'Advanced leg strength', 'assets/img/squat_animation.gif', 0, 5, 3, 'hard', 'Legs'],
    ];

    for (var data in strengthData) {
      allExercises.add(Exercise(
        id: data[0] as String,
        name: 'Coach Jordan',
        title: data[1] as String,
        description: data[2] as String,
        animationAsset: data[3] as String,
        category: 'active',
        durationSeconds: data[4] as int,
        repetitions: data[5] as int,
        sets: data[6] as int,
        difficulty: data[7] as String,
        muscleGroups: [data[8] as String],
        instructions: 'Focus on form and controlled movements.',
      ));
    }

    // BACK STABILIZATION (6 exercises)
    final backData = [
      ['bs1', 'McGill Curl-Up', 'Core stability without spinal flexion', 'assets/img/straight.jpg', 10, 0, 3, 'easy', 'Core'],
      ['bs2', 'Side Plank', 'Lateral core stability', 'assets/img/straight.jpg', 30, 0, 3, 'medium', 'Obliques'],
      ['bs3', 'Bird-Dog', 'Coordination and posterior chain', 'assets/img/straight.jpg', 10, 0, 3, 'medium', 'Back, Glutes'],
      ['bs4', 'Dead Bug', 'Deep core activation', 'assets/img/straight.jpg', 0, 12, 3, 'medium', 'Core'],
      ['bs5', 'Glute Bridge', 'Posterior chain activation', 'assets/img/straight.jpg', 0, 15, 3, 'easy', 'Glutes, Back'],
      ['bs6', 'Superman', 'Lower back strength', 'assets/img/straight.jpg', 30, 0, 3, 'medium', 'Lower Back'],
    ];

    for (var data in backData) {
      allExercises.add(Exercise(
        id: data[0] as String,
        name: 'Dr. McGill',
        title: data[1] as String,
        description: data[2] as String,
        animationAsset: data[3] as String,
        category: 'back_stabilization',
        durationSeconds: data[4] as int,
        repetitions: data[5] as int,
        sets: data[6] as int,
        difficulty: data[7] as String,
        muscleGroups: [data[8] as String],
        instructions: 'Hold positions with maximum tension.',
      ));
    }

    // STRETCH (5 exercises)
    final stretchData = [
      ['st1', 'Cobra Stretch', 'Abdominal and back stretch', 'assets/img/stretch_animation.gif', 30, 0, 1, 'easy', 'Abs, Back'],
      ['st2', 'Child\'s Pose', 'Relaxation and back stretch', 'assets/img/stretch_animation.gif', 45, 0, 1, 'easy', 'Back'],
      ['st3', 'Hamstring Stretch', 'Leg flexibility', 'assets/img/stretch_animation.gif', 30, 0, 1, 'easy', 'Hamstrings'],
      ['st4', 'Chest Opener', 'Upper body flexibility', 'assets/img/stretch_animation.gif', 30, 0, 1, 'easy', 'Chest'],
      ['st5', 'Pigeon Pose', 'Hip opener', 'assets/img/stretch_animation.gif', 45, 0, 1, 'medium', 'Hips'],
    ];

    for (var data in stretchData) {
      allExercises.add(Exercise(
        id: data[0] as String,
        name: 'Yogi Sam',
        title: data[1] as String,
        description: data[2] as String,
        animationAsset: data[3] as String,
        category: 'stretch',
        durationSeconds: data[4] as int,
        repetitions: data[5] as int,
        sets: data[6] as int,
        difficulty: data[7] as String,
        muscleGroups: [data[8] as String],
        instructions: 'Breathe deeply and sink into the stretch.',
      ));
    }

    // COOLDOWN (4 exercises)
    final cooldownData = [
      ['c1', 'Deep Breathing', 'Heart rate recovery', 'assets/img/straight.jpg', 120, 0, 1, 'easy', 'Full Body'],
      ['c2', 'Forward Fold', 'Gentle spine decompression', 'assets/img/stretch_animation.gif', 60, 0, 1, 'easy', 'Back'],
      ['c3', 'Neck Rolls', 'Release tension', 'assets/img/straight.jpg', 30, 0, 1, 'easy', 'Neck'],
      ['c4', 'Quadriceps Stretch', 'Leg recovery', 'assets/img/stretch_animation.gif', 30, 0, 1, 'easy', 'Quads'],
    ];

    for (var data in cooldownData) {
      allExercises.add(Exercise(
        id: data[0] as String,
        name: 'Recovery Coach',
        title: data[1] as String,
        description: data[2] as String,
        animationAsset: data[3] as String,
        category: 'cooldown',
        durationSeconds: data[4] as int,
        repetitions: data[5] as int,
        sets: data[6] as int,
        difficulty: data[7] as String,
        muscleGroups: [data[8] as String],
        instructions: 'Slow down and let your body recover.',
      ));
    }

    exercises = allExercises;
  }

  void _initializeGyms() {
    gyms = [
      Gym(title: 'Joggeli Fitness Club Basel', address: 'Gellertstrasse 235', mapImage: 'assets/img/gym/joggeli.jpg', code: 1, link: 'https://maps.app.goo.gl/PnfYL'),
      Gym(title: 'Actifit Fitness AG', address: 'Rümelinbachweg 4', mapImage: 'assets/img/gym/actifit.jpg', code: 2, warning: 'Women only!', link: 'https://maps.app.goo.gl/cTdsj'),
    ];
  }

  void _initializeMockHistory() {
    workoutHistory = [
      WorkoutHistoryEntry(
        workoutId: 'w_mock_1',
        date: DateTime.now().subtract(const Duration(days: 2)),
        durationMinutes: 25,
        completedExercises: [
          CompletedExercise(exerciseId: 'w1', setsCompleted: 1, durationSeconds: 60),
          CompletedExercise(exerciseId: 's1', setsCompleted: 3, repsCompleted: 15),
        ],
      ),
      WorkoutHistoryEntry(
        workoutId: 'w_mock_2',
        date: DateTime.now().subtract(const Duration(days: 1)),
        durationMinutes: 30,
        completedExercises: [
          CompletedExercise(exerciseId: 'w2', setsCompleted: 1, durationSeconds: 30),
          CompletedExercise(exerciseId: 'bs1', setsCompleted: 3, durationSeconds: 10),
        ],
      ),
    ];
  }

  List<Exercise> getExercisesByCategory(String categoryId) {
    return exercises.where((e) => e.category == categoryId).toList();
  }

  void toggleFavorite(String exerciseId) {
    if (favoriteExerciseIds.contains(exerciseId)) {
      favoriteExerciseIds.remove(exerciseId);
    } else {
      favoriteExerciseIds.add(exerciseId);
    }
    notifyListeners();
  }

  bool isFavorite(String exerciseId) => favoriteExerciseIds.contains(exerciseId);

  void addWorkoutHistory(WorkoutHistoryEntry entry) {
    workoutHistory.add(entry);
    notifyListeners();
  }

  void removeExercise(String id) {
    exercises.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void moveExerciseToEnd(String id) {
    final index = exercises.indexWhere((e) => e.id == id);
    if (index != -1) {
      final exercise = exercises.removeAt(index);
      exercises.add(exercise);
      notifyListeners();
    }
  }
}
