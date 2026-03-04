import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tabs_screen.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 3);
          },
          children: [
            buildPage(
              color: AppTheme.primary,
              url: 'assets/img/ica-slidebox-img-1.png',
              title: 'Welcome to JumpBuddy',
              subtitle: 'The ultimate companion for skydiving enthusiasts and vertical leap training.',
            ),
            buildPage(
              color: AppTheme.secondary,
              url: 'assets/img/ica-slidebox-img-2.png',
              title: 'Train Anywhere',
              subtitle: 'Access workout routines designed to improve your strength and flexibility.',
            ),
            buildPage(
              color: AppTheme.light,
              url: 'assets/img/ica-slidebox-img-3.png',
              title: 'Find Your Gym',
              subtitle: 'Locate the best fitness centers in your area to keep your training on track.',
            ),
            buildPage(
              color: AppTheme.danger,
              url: 'assets/img/ica-slidebox-img-4.png',
              title: 'Ready to Jump?',
              subtitle: 'Join our community and start your journey to new heights today!',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                foregroundColor: Colors.white,
                backgroundColor: AppTheme.dark,
                minimumSize: const Size.fromHeight(80),
              ),
              child: const Text(
                'GET STARTED',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('showHome', true);

                if (mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const TabsScreen()),
                  );
                }
              },
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('SKIP'),
                    onPressed: () => controller.jumpToPage(3),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: AppTheme.dark,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text('NEXT'),
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required Color color,
    required String url,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 100),
            ),
            const SizedBox(height: 64),
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.dark,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppTheme.dark, fontSize: 18),
              ),
            ),
          ],
        ),
      );
}
