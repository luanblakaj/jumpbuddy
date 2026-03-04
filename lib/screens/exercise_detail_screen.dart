import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_models.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import 'workout_timer_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 350.0,
              pinned: true,
              backgroundColor: AppTheme.background,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      exercise.animationAsset,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppTheme.light,
                        child: const Icon(Icons.fitness_center, size: 100),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppTheme.background.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise.title,
                              style: GoogleFonts.notoSans(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.dark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'with ${exercise.name}',
                              style: const TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            provider.isFavorite(exercise.id) ? Icons.favorite : Icons.favorite_border,
                            color: provider.isFavorite(exercise.id) ? AppTheme.danger : Colors.grey,
                            size: 32,
                          ),
                          onPressed: () => provider.toggleFavorite(exercise.id),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(Icons.timer, '${exercise.durationSeconds > 0 ? exercise.durationSeconds : 60}s', 'Duration'),
                        _buildStatItem(Icons.fitness_center, exercise.difficulty.toUpperCase(), 'Difficulty'),
                        _buildStatItem(Icons.repeat, '${exercise.sets} Sets', 'Volume'),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Description',
                      style: GoogleFonts.notoSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.dark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      exercise.description,
                      style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Instructions',
                      style: GoogleFonts.notoSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.dark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      exercise.instructions,
                      style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WorkoutTimerScreen(exercise: exercise),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 64),
            backgroundColor: AppTheme.primary,
            foregroundColor: AppTheme.dark,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            elevation: 8,
          ),
          child: const Text('START WORKOUT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppTheme.primary, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
