import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/app_provider.dart';
import 'screens/onboarding_screen.dart';
import 'screens/tabs_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: JumpBuddyApp(showHome: showHome),
    ),
  );
}

class JumpBuddyApp extends StatelessWidget {
  final bool showHome;

  const JumpBuddyApp({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JumpBuddy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: showHome ? const TabsScreen() : const OnboardingScreen(),
    );
  }
}
