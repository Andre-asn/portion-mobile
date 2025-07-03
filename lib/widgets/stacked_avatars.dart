import 'package:flutter/material.dart';

/// A widget that shows a row of small profile pictures (avatars) stacked on top of each other.
/// Great for showing a group of people, like table participants.
class StackedAvatars extends StatelessWidget {
  final List<String> imageUrls; // List of image URLs for the avatars
  final double size; // Size of each avatar
  final int maxAvatarsToShow; // Max number of avatars to show before showing "+N"

  const StackedAvatars({
    super.key,
    required this.imageUrls,
    this.size = 32,
    this.maxAvatarsToShow = 4,
  });

  @override
  Widget build(BuildContext context) {
    // Only show up to maxAvatarsToShow avatars, rest will be "+N"
    final avatarsToShow = imageUrls.take(maxAvatarsToShow).toList();
    final extraCount = imageUrls.length - avatarsToShow.length;
    // The amount each avatar overlaps the previous one
    final overlap = size * 0.35;

    return SizedBox(
      width: size + (avatarsToShow.length - 1) * overlap + (extraCount > 0 ? size : 0),
      height: size,
      child: Stack(
        children: [
          // For each avatar, position it a bit to the right
          for (int i = 0; i < avatarsToShow.length; i++)
            Positioned(
              left: i * overlap,
              child: CircleAvatar(
                radius: size / 2,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(avatarsToShow[i]),
              ),
            ),
          // If there are extra avatars, show a "+N" circle at the end
          if (extraCount > 0)
            Positioned(
              left: avatarsToShow.length * overlap,
              child: CircleAvatar(
                radius: size / 2,
                backgroundColor: Colors.grey.shade400,
                child: Text(
                  '+$extraCount',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// How to use this widget:
///
/// StackedAvatars(
///   imageUrls: [
///     'https://randomuser.me/api/portraits/men/1.jpg',
///     'https://randomuser.me/api/portraits/women/2.jpg',
///     'https://randomuser.me/api/portraits/men/3.jpg',
///     'https://randomuser.me/api/portraits/women/4.jpg',
///     'https://randomuser.me/api/portraits/men/5.jpg',
///   ],
/// ) 