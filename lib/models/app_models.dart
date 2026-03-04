import 'package:uuid/uuid.dart';

class Exercise {
  final String id;
  final String name;
  final String title;
  final String description;
  final String animationAsset;
  final String? imageUrl;
  final String category;
  final List<String> tags;
  final int durationSeconds;
  final int repetitions;
  final int sets;
  final String difficulty;
  final List<String> muscleGroups;
  final bool isFavorite;
  final String instructions;

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
    this.instructions = '',
  });

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
    String? instructions,
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
      instructions: instructions ?? this.instructions,
    );
  }
}

class Gym {
  final String title;
  final String address;
  final String mapImage;
  final int code;
  final String? warning;
  final String link;

  Gym({
    required this.title,
    required this.address,
    required this.mapImage,
    required this.code,
    this.warning,
    required this.link,
  });
}

class WorkoutCategory {
  final String id;
  final String title;
  final String image;
  final String description;

  WorkoutCategory({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
}

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

class WorkoutHistoryEntry {
  final String id;
  final String workoutId;
  final DateTime date;
  final int durationMinutes;
  final List<CompletedExercise> completedExercises;

  WorkoutHistoryEntry({
    String? id,
    required this.workoutId,
    required this.date,
    required this.durationMinutes,
    this.completedExercises = const [],
  }) : id = id ?? const Uuid().v4();
}

class CompletedExercise {
  final String exerciseId;
  final int setsCompleted;
  final int repsCompleted;
  final double? weightUsed;
  final int durationSeconds;

  CompletedExercise({
    required this.exerciseId,
    required this.setsCompleted,
    this.repsCompleted = 0,
    this.weightUsed,
    this.durationSeconds = 0,
  });
}

class Workout {
  final String id;
  final String title;
  final String description;
  final List<String> exerciseIds;
  final String category;
  final int estimatedDurationMinutes;
  final String difficulty;

  Workout({
    String? id,
    required this.title,
    required this.description,
    required this.exerciseIds,
    required this.category,
    required this.estimatedDurationMinutes,
    required this.difficulty,
  }) : id = id ?? const Uuid().v4();
}

class ProgressData {
  final DateTime date;
  final double value;
  final String metric;

  ProgressData({
    required this.date,
    required this.value,
    required this.metric,
  });
}
