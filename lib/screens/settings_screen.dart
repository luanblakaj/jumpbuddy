import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exercise_detail_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Profile',
                  style: GoogleFonts.notoSans(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                _buildProfileHeader(),
                const SizedBox(height: 32),
                _buildSectionTitle('Favorites'),
                const SizedBox(height: 16),
                _buildFavoritesList(provider, context),
                const SizedBox(height: 32),
                _buildSectionTitle('Workout History'),
                const SizedBox(height: 16),
                _buildHistoryTimeline(provider),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppTheme.primary,
            child: Icon(Icons.person, size: 48, color: AppTheme.dark),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'JumpBuddy User',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppTheme.dark),
              ),
              Text(
                'Level 12 Athlete',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.notoSans(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  Widget _buildFavoritesList(AppProvider provider, BuildContext context) {
    final favorites = provider.exercises.where((e) => provider.favoriteExerciseIds.contains(e.id)).toList();

    if (favorites.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white24),
        ),
        child: const Center(
          child: Text('No favorites yet. Start hearting!', style: TextStyle(color: Colors.white70)),
        ),
      );
    }

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final exercise = favorites[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ExerciseDetailScreen(exercise: exercise),
                ),
              );
            },
            child: Container(
              width: 100,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.fitness_center, color: AppTheme.primary, size: 32),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      exercise.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppTheme.dark),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHistoryTimeline(AppProvider provider) {
    if (provider.workoutHistory.isEmpty) {
      return const Center(child: Text('No history yet.', style: TextStyle(color: Colors.white70)));
    }

    return Column(
      children: provider.workoutHistory.reversed.map((entry) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white24),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.history, color: AppTheme.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Workout Session',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Text(
                      '${entry.date.day}/${entry.date.month}/${entry.date.year} • ${entry.durationMinutes} mins',
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white38),
            ],
          ),
        );
      }).toList(),
    );
  }
}
