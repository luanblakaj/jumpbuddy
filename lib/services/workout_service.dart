import 'package:flutter/material.dart';
import '../models/app_models.dart';

class WorkoutService extends ChangeNotifier {
  int _elapsedSeconds = 0;
  int _totalSeconds = 0;
  bool _isRunning = false;
  
  int get elapsedSeconds => _elapsedSeconds;
  int get totalSeconds => _totalSeconds;
  bool get isRunning => _isRunning;
  
  String get formattedTime {
    final minutes = _elapsedSeconds ~/ 60;
    final seconds = _elapsedSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
  
  double get progress => _totalSeconds > 0 ? _elapsedSeconds / _totalSeconds : 0.0;

  void startTimer(int durationSeconds) {
    _totalSeconds = durationSeconds;
    _elapsedSeconds = 0;
    _isRunning = true;
    _tick();
    notifyListeners();
  }

  void pauseTimer() {
    _isRunning = false;
    notifyListeners();
  }

  void resumeTimer() {
    _isRunning = true;
    _tick();
    notifyListeners();
  }

  void resetTimer() {
    _elapsedSeconds = 0;
    _totalSeconds = 0;
    _isRunning = false;
    notifyListeners();
  }

  void _tick() {
    if (_isRunning && _elapsedSeconds < _totalSeconds) {
      Future.delayed(const Duration(seconds: 1), () {
        _elapsedSeconds++;
        notifyListeners();
        if (_elapsedSeconds < _totalSeconds) {
          _tick();
        } else {
          _isRunning = false;
          notifyListeners();
        }
      });
    }
  }
}

class ProgressTracker extends ChangeNotifier {
  List<ProgressData> _progressHistory = [];
  
  List<ProgressData> get progressHistory => _progressHistory;
  
  void addProgress(ProgressData data) {
    _progressHistory.add(data);
    _progressHistory.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
  }
  
  void removeProgress(ProgressData data) {
    _progressHistory.remove(data);
    notifyListeners();
  }
  
  List<ProgressData> getProgressByMetric(String metric) {
    return _progressHistory.where((p) => p.metric == metric).toList();
  }
  
  double? getLatestValue(String metric) {
    final filtered = getProgressByMetric(metric);
    return filtered.isNotEmpty ? filtered.last.value : null;
  }
  
  double? getAverageProgress(String metric, {int days = 30}) {
    final filtered = getProgressByMetric(metric);
    final now = DateTime.now();
    final recentData = filtered.where((p) {
      final difference = now.difference(p.date).inDays;
      return difference <= days;
    }).toList();
    
    if (recentData.isEmpty) return null;
    final sum = recentData.fold<double>(0, (prev, curr) => prev + curr.value);
    return sum / recentData.length;
  }
}

class StreakTracker extends ChangeNotifier {
  int _currentStreak = 0;
  DateTime? _lastWorkoutDate;
  int _longestStreak = 0;
  
  int get currentStreak => _currentStreak;
  int get longestStreak => _longestStreak;
  DateTime? get lastWorkoutDate => _lastWorkoutDate;
  
  void recordWorkout() {
    final now = DateTime.now();
    
    if (_lastWorkoutDate != null) {
      final difference = now.difference(_lastWorkoutDate!).inDays;
      
      if (difference == 1) {
        _currentStreak++;
      } else if (difference > 1) {
        _longestStreak = _currentStreak > _longestStreak ? _currentStreak : _longestStreak;
        _currentStreak = 1;
      }
    } else {
      _currentStreak = 1;
    }
    
    _lastWorkoutDate = now;
    notifyListeners();
  }
  
  bool canWorkoutToday() {
    if (_lastWorkoutDate == null) return true;
    final difference = DateTime.now().difference(_lastWorkoutDate!).inDays;
    return difference >= 1;
  }
  
  int daysUntilNextWorkout() {
    if (_lastWorkoutDate == null) return 0;
    final difference = DateTime.now().difference(_lastWorkoutDate!).inDays;
    return difference >= 1 ? 0 : 1;
  }
}
