import 'package:flutter/material.dart';
import '../models/app_models.dart';

class AppProvider with ChangeNotifier {
  final List<WorkoutCategory> categories = [
    WorkoutCategory(
      id: 'warmup',
      title: 'Warmup',
      image: 'assets/img/straight.jpg',
      description: 'Prepare your body for the jump.',
    ),
    WorkoutCategory(
      id: 'active',
      title: 'Active/Strength',
      image: 'assets/img/weights.jpg',
      description: 'Build power and endurance.',
    ),
    WorkoutCategory(
      id: 'stretch',
      title: 'Stretch',
      image: 'assets/img/stretch.jpg',
      description: 'Improve flexibility and range of motion.',
    ),
    WorkoutCategory(
      id: 'cooldown',
      title: 'Cooldown',
      image: 'assets/img/cooldown.jpg',
      description: 'Relax and recover after your workout.',
    ),
  ];

  final List<Exercise> exercises = [
    // Warmup
    Exercise(
      id: 'w1',
      name: 'Trainer A',
      title: '10x Push-Ups',
      content: 'Push-Ups are a great way to warm up and build up your muscle mass. The whole body needs more muscles in order to be able to increase your vertical.',
      imageSource: 'assets/img/pushups_animation.gif',
      profilePictureSource: 'assets/img/speakers/bear.jpg',
      category: 'warmup',
    ),
    Exercise(
      id: 'w2',
      name: 'Trainer B',
      title: 'Stretch',
      content: "It is crucial that you stretch before exercising. You should focus on leg stretches since you'll mainly be training your legs.",
      imageSource: 'assets/img/stretch_animation.gif',
      profilePictureSource: 'assets/img/speakers/cheetah.jpg',
      category: 'warmup',
    ),
    Exercise(
      id: 'w3',
      name: 'Luan B.',
      title: '20x Calf Raises',
      content: 'Stand with your legs together. Lift yourself onto your toes, then lower yourself down. Move slowly to make the muscles work harder.',
      imageSource: 'assets/img/calves_animation.gif',
      profilePictureSource: 'assets/img/speakers/eagle.jpg',
      category: 'warmup',
    ),
    Exercise(
      id: 'w4',
      name: 'Trainer D',
      title: '15x Squats',
      content: 'Place your feet hip-width apart, and keep your heels flat on the ground. Slowly lower yourself as far as you can by simply bending your knees while keeping your back erect and your neck straight.',
      imageSource: 'assets/img/squat_animation.gif',
      profilePictureSource: 'assets/img/speakers/elephant.jpg',
      category: 'warmup',
    ),
    Exercise(
      id: 'w5',
      name: 'Trainer E',
      title: '15x Lunges',
      content: 'Start in a standing position. Take a big step forward, bending your front knee. Lean your body forward with your front knee lined up vertically above your ankle.',
      imageSource: 'assets/img/character_lunges.gif',
      profilePictureSource: 'assets/img/speakers/giraffe.jpg',
      category: 'warmup',
    ),
    // Active/Strength
    Exercise(
      id: 'a1',
      name: 'Trainer F',
      title: 'Box Jumps',
      content: 'Find a sturdy box or platform. Jump onto it with both feet, landing softly. Step down and repeat. This builds explosive power.',
      imageSource: 'assets/img/character_jump_grey.gif',
      profilePictureSource: 'assets/img/speakers/lion.jpg',
      category: 'active',
    ),
    Exercise(
      id: 'a2',
      name: 'Trainer G',
      title: 'Burpees',
      content: 'A full-body exercise used in strength training and as an aerobic exercise. The basic movement is performed in four steps.',
      imageSource: 'assets/img/character_flying.gif',
      profilePictureSource: 'assets/img/speakers/tiger.jpg', // Assuming tiger exists or using another
      category: 'active',
    ),
  ];

  final List<Gym> gyms = [
    Gym(title: 'Joggeli Fitness Club Basel', address: 'Gellertstrasse 235', mapImage: 'assets/img/gym/joggeli.jpg', code: 1, link: 'https://maps.app.goo.gl/PnfYL'),
    Gym(title: 'Actifit Fitness AG', address: 'Rümelinbachweg 4', mapImage: 'assets/img/gym/actifit.jpg', code: 2, warning: 'Women only!', link: 'https://maps.app.goo.gl/cTdsj'),
    Gym(title: 'World-Gym Sportstudio', address: 'Reinacherstrasse 125', mapImage: 'assets/img/gym/world.jpg', code: 3, link: 'https://maps.app.goo.gl/DdNj2'),
    Gym(title: 'Indigo Fitness Club', address: 'Sternengasse 19', mapImage: 'assets/img/gym/indigo.jpg', code: 4, link: 'https://maps.app.goo.gl/7efzN'),
    Gym(title: 'Fitorama AG', address: 'Lange Gasse 90', mapImage: 'assets/img/gym/fitorama.jpg', code: 5, link: 'https://maps.app.goo.gl/vzeko'),
    Gym(title: 'basefit.ch AG Basel Clarahuus', address: 'Teichgässlein 9', mapImage: 'assets/img/gym/basefit.jpg', code: 6, link: 'https://maps.app.goo.gl/97AZU'),
    Gym(title: 'Fitnessplus Basel Ag', address: 'Dornacherstrasse 210', mapImage: 'assets/img/gym/fitnessplus.jpg', code: 7, link: 'https://maps.app.goo.gl/LzJmu'),
    Gym(title: 'City Sport + Gesundheit AG', address: 'Rebgasse 20', mapImage: 'assets/img/gym/citysport.jpg', code: 8, link: 'https://maps.app.goo.gl/JTYp7'),
    Gym(title: 'basefit.ch Basel St. Johann', address: ' Vogesenstrasse 87', mapImage: 'assets/img/gym/basefit1.jpg', code: 9, link: 'https://maps.app.goo.gl/HbfUs'),
    Gym(title: 'bodyline Dinkel & Mattioli', address: 'Missionsstrasse 52', mapImage: 'assets/img/gym/bodyline.jpg', code: 10, link: 'https://maps.app.goo.gl/yH1n8'),
  ];

  List<Exercise> getExercisesByCategory(String categoryId) {
    return exercises.where((e) => e.category == categoryId).toList();
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
