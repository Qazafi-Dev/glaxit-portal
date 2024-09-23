import 'package:flutter/material.dart';

class OverlappingCircularImages extends StatelessWidget {
  final List<String> imageUrls;
  final double size;
  final double overlap;

  const OverlappingCircularImages({
    Key? key,
    required this.imageUrls,
    this.size = 50.0,
    this.overlap = 0.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size + (imageUrls.length - 1) * size * (1 - overlap),
      height: size,
      child: Stack(
        children: List.generate(imageUrls.length, (index) {
          return Positioned(
            left: index * size * (1 - overlap),
            child: ClipOval(
              child: Image.network(
                imageUrls[index],
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error); // Shows error icon if the image fails to load
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
