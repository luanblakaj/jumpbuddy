import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_models.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import 'exercise_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseListScreen extends StatelessWidget {
  final WorkoutCategory category;

  const ExerciseListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final exercises = provider.getExercisesByCategory(category.id);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150.0,
              pinned: true,
              backgroundColor: AppTheme.background,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  category.title,
                  style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.dark.withOpacity(0.5),
                        AppTheme.background,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            exercises.isEmpty
                ? const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No exercises found.',
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final exercise = exercises[index];
                          return _buildExerciseCard(context, exercise);
                        },
                        childCount: exercises.length,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context, Exercise exercise) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ExerciseDetailScreen(exercise: exercise),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    exercise.animationAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.fitness_center, color: AppTheme.primary),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.title,
                      style: GoogleFonts.notoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.dark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildBadge(exercise.difficulty.toUpperCase(), _getDifficultyColor(exercise.difficulty)),
                        const SizedBox(width: 8),
                        _buildBadge(exercise.muscleGroups.first, Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      exercise.description,
                      style: const TextStyle(color: Colors.black54, fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
