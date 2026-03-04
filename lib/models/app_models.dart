class Exercise {
  final String id;
  final String name;
  final String title;
  final String content;
  final String imageSource;
  final String profilePictureSource;
  final String category;

  Exercise({
    required this.id,
    required this.name,
    required this.title,
    required this.content,
    required this.imageSource,
    required this.profilePictureSource,
    required this.category,
  });
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
