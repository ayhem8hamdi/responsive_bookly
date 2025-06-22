import 'package:bookly/features/home/data/models/book_model/book_model/item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:shimmer/shimmer.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.item});
  final Item item;

  String _getProxiedImageUrl(String originalUrl) {
    if (originalUrl.isEmpty) return originalUrl;
    return "https://corsproxy.io/?${Uri.encodeComponent(originalUrl)}";
  }

  @override
  Widget build(BuildContext context) {
    final originalUrl = item.volumeInfo!.getDisplayImageUrl();
    final imageUrl =
        originalUrl != null ? _getProxiedImageUrl(originalUrl) : null;

    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            fit: BoxFit.cover,
            placeholder: (context, url) => const BookImageLoader(),
            errorWidget: (context, url, error) => const BookFallbackImage(),
          ),
        ),
      ),
    );
  }
}

class BookImageLoader extends StatelessWidget {
  const BookImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.grey[300],
      ),
    );
  }
}

class BookFallbackImage extends StatelessWidget {
  const BookFallbackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(
          LucideIcons.bookOpen,
          color: Colors.grey[500],
          size: 50,
        ),
      ),
    );
  }
}
