import 'package:flutter/material.dart';
import 'dart:async';
import '../models/app_models.dart';
import '../theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutTimerScreen extends StatefulWidget {
  final Exercise exercise;

  const WorkoutTimerScreen({super.key, required this.exercise});

  @override
  State<WorkoutTimerScreen> createState() => _WorkoutTimerScreenState();
}

class _WorkoutTimerScreenState extends State<WorkoutTimerScreen> {
  late int _timeLeft;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.exercise.durationSeconds > 0 ? widget.exercise.durationSeconds : 60;
  }

  void _startTimer() {
    if (_timer != null) _timer!.cancel();
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() => _timeLeft--);
      } else {
        _timer!.cancel();
        setState(() => _isRunning = false);
        _showCompletionDialog();
      }
    });
  }

  void _pauseTimer() {
    if (_timer != null) _timer!.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _pauseTimer();
    setState(() => _timeLeft = widget.exercise.durationSeconds > 0 ? widget.exercise.durationSeconds : 60);
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        title: const Text('Workout Complete!'),
        content: const Text('Great job! You\'ve finished this exercise.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('DONE'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_timer != null) _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 32),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Spacer(),
                    Text(
                      'Workout Timer',
                      style: GoogleFonts.notoSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                widget.exercise.title,
                style: GoogleFonts.notoSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.exercise.name,
                style: const TextStyle(color: Colors.white70, fontSize: 18),
              ),
              const Spacer(),
              _buildTimerDisplay(),
              const Spacer(),
              _buildControls(),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimerDisplay() {
    double progress = _timeLeft / (widget.exercise.durationSeconds > 0 ? widget.exercise.durationSeconds : 60);
    
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 280,
          height: 280,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 12,
            backgroundColor: Colors.white10,
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primary),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _formatTime(_timeLeft),
              style: GoogleFonts.notoSans(
                fontSize: 72,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const Text(
              'REMAINING',
              style: TextStyle(color: Colors.white60, letterSpacing: 2),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white60, size: 40),
          onPressed: _resetTimer,
        ),
        const SizedBox(width: 40),
        GestureDetector(
          onTap: _isRunning ? _pauseTimer : _startTimer,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              _isRunning ? Icons.pause : Icons.play_arrow,
              color: AppTheme.dark,
              size: 48,
            ),
          ),
        ),
        const SizedBox(width: 40),
        IconButton(
          icon: const Icon(Icons.skip_next, color: Colors.white60, size: 40),
          onPressed: () => _showCompletionDialog(),
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
