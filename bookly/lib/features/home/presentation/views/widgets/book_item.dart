import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.volumeInfo});
  final VolumeInfo volumeInfo;

  String _getProxiedImageUrl(String originalUrl) {
    if (originalUrl.isEmpty) return originalUrl;
    return "https://corsproxy.io/?${Uri.encodeComponent(originalUrl)}";
  }

  @override
  Widget build(BuildContext context) {
    final originalUrl = volumeInfo.getDisplayImageUrl();
    final imageUrl =
        originalUrl != null ? _getProxiedImageUrl(originalUrl) : null;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[300],
            image: DecorationImage(
              image: imageUrl != null
                  ? NetworkImage(imageUrl)
                  : NetworkImage(volumeInfo.getFallbackImageUrl()),
              fit: BoxFit.cover,
              onError: (_, __) =>
                  NetworkImage(volumeInfo.getFallbackImageUrl()),
            ),
          ),
        ),
      ),
    );
  }
}
