import 'package:flutter/material.dart';
import '../models/app_models.dart';

class AppProvider extends ChangeNotifier {
  List<Exercise> exercises = [];
  List<Gym> gyms = [];
  List<WorkoutCategory> categories = [];
  List<String> favoriteExerciseIds = [];
  List<WorkoutHistoryEntry> workoutHistory = [];

  AppProvider() {
    _initializeData();
  }

  void _initializeData() {
    _initializeCategories();
    _initializeExercises();
    _initializeGyms();
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
    exercises = [
      Exercise(
        id: 'w1',
        name: 'Trainer A',
        title: '10x Push-Ups',
        description: 'Push-Ups warm up your entire upper body and build muscle mass.',
        animationAsset: 'assets/img/pushups_animation.gif',
        category: 'warmup',
        tags: const ['bodyweight', 'beginner'],
        repetitions: 10,
        sets: 1,
        difficulty: 'easy',
        muscleGroups: const ['chest', 'shoulders', 'triceps'],
        instructions: 'Start in a plank position. Lower your body until your chest nearly touches the floor, then push back up.',
      ),
      Exercise(
        id: 'w2',
        name: 'Trainer B',
        title: 'Dynamic Stretching',
        description: 'Dynamic stretching prepares your muscles for activity.',
        animationAsset: 'assets/img/stretch_animation.gif',
        category: 'warmup',
        tags: const ['flexibility', 'beginner'],
        durationSeconds: 60,
        difficulty: 'easy',
        muscleGroups: const ['full-body'],
        instructions: 'Perform controlled movements through your full range of motion.',
      ),
      Exercise(
        id: 'bs1',
        name: 'Dr. McGill',
        title: 'McGill Curl-Up',
        description: 'Research-backed exercise for core stability without excessive spinal flexion.',
        animationAsset: 'assets/img/straight.jpg',
        category: 'back_stabilization',
        tags: const ['core', 'science-backed'],
        durationSeconds: 10,
        sets: 3,
        difficulty: 'easy',
        muscleGroups: const ['core'],
        instructions: 'Lie on your back with one leg straight. Lift your head and shoulders slightly. Hold for 10 seconds.',
      ),
      Exercise(
        id: 'bs2',
        name: 'Dr. McGill',
        title: 'Side Plank',
        description: 'Essential for lateral core stability and back health.',
        animationAsset: 'assets/img/straight.jpg',
        category: 'back_stabilization',
        tags: const ['core', 'science-backed'],
        durationSeconds: 10,
        sets: 3,
        difficulty: 'medium',
        muscleGroups: const ['obliques', 'core'],
        instructions: 'Lie on your side. Lift your hips to form a straight line. Hold for 10 seconds.',
      ),
      Exercise(
        id: 'bs3',
        name: 'Dr. McGill',
        title: 'Bird-Dog',
        description: 'Improves coordination and posterior chain stability.',
        animationAsset: 'assets/img/straight.jpg',
        category: 'back_stabilization',
        tags: const ['core', 'science-backed'],
        durationSeconds: 10,
        sets: 3,
        difficulty: 'medium',
        muscleGroups: const ['back', 'glutes'],
        instructions: 'On all fours, extend opposite arm and leg. Keep your back flat. Hold for 10 seconds.',
      ),
    ];
  }

  void _initializeGyms() {
    gyms = [
      Gym(title: 'Joggeli Fitness Club Basel', address: 'Gellertstrasse 235', mapImage: 'assets/img/gym/joggeli.jpg', code: 1, link: 'https://maps.app.goo.gl/PnfYL'),
      Gym(title: 'Actifit Fitness AG', address: 'Rümelinbachweg 4', mapImage: 'assets/img/gym/actifit.jpg', code: 2, warning: 'Women only!', link: 'https://maps.app.goo.gl/cTdsj'),
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
