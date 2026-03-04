import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_models.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import 'exercise_detail_screen.dart';

class ExerciseListScreen extends StatelessWidget {
  final WorkoutCategory category;

  const ExerciseListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final exercises = provider.getExercisesByCategory(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: exercises.isEmpty
          ? const Center(
              child: Text(
                'No exercises found for this category.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(exercise.profilePictureSource),
                      radius: 30,
                      onBackgroundImageError: (exception, stackTrace) => const Icon(Icons.person),
                    ),
                    title: Text(
                      exercise.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          exercise.name,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          exercise.content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailScreen(exercise: exercise),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
