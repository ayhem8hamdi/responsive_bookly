import 'package:bookly/core/utils/image_loader_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model/volume_info.dart';

import 'package:flutter/foundation.dart';

class ImageProcessor {
  final ImageLoaderService imageLoader;

  ImageProcessor(this.imageLoader);

  Future<ImageLinks> processImageLinks(ImageLinks? imageLinks) async {
    if (imageLinks == null) return const ImageLinks();

    final processed = await Future.wait([
      _processUrl(imageLinks.smallThumbnail),
      _processUrl(imageLinks.thumbnail),
      _processUrl(imageLinks.small),
      _processUrl(imageLinks.medium),
      _processUrl(imageLinks.large),
      _processUrl(imageLinks.extraLarge),
    ]);

    return ImageLinks(
      smallThumbnail: processed[0],
      thumbnail: processed[1],
      small: processed[2],
      medium: processed[3],
      large: processed[4],
      extraLarge: processed[5],
    );
  }

  Future<String?> _processUrl(String? url) async {
    if (url == null) return null;

    final result = await imageLoader.getLoadableImageUrl(url);
    return result.fold(
      (failure) {
        debugPrint('Failed to process image URL: ${failure.message}');
        return url;
      },
      (processedUrl) => processedUrl,
    );
  }

  static String? sanitizeGoogleBooksUrl(String? url) {
    if (url == null || url.isEmpty) return null;

    try {
      url = url.replaceAll('http://', 'https://');

      if (url.contains('books.google.com')) {
        url = url.replaceAll(RegExp(r'&edge=[^&]*'), '');

        if (url.contains('zoom=')) {
          url = url.replaceAll(RegExp(r'zoom=\d+'), 'zoom=1');
        } else {
          url = url.contains('?') ? '$url&zoom=1' : '$url?zoom=1';
        }

        if (!url.contains('source=')) {
          url =
              url.contains('?') ? '$url&source=gbs_api' : '$url?source=gbs_api';
        }

        url = url.replaceAll(' ', '%20');
      }

      final uri = Uri.tryParse(url);
      return uri?.hasAbsolutePath == true ? url : null;
    } catch (e) {
      debugPrint('Error sanitizing URL: $e');
      return null;
    }
  }

  static String getPlaceholderImageUrl(String bookTitle, String? author) {
    final seed = '${bookTitle}_${author ?? 'unknown'}'.hashCode.abs();
    return 'https://picsum.photos/seed/$seed/300/400';
  }

  static String? getBestImageUrl(ImageLinks? imageLinks) {
    if (imageLinks == null) return null;

    const imageOptions = [
      'thumbnail',
      'small',
      'medium',
      'smallThumbnail',
      'large',
      'extraLarge'
    ];

    for (final option in imageOptions) {
      final url = switch (option) {
        'thumbnail' => imageLinks.thumbnail,
        'small' => imageLinks.small,
        'medium' => imageLinks.medium,
        'smallThumbnail' => imageLinks.smallThumbnail,
        'large' => imageLinks.large,
        'extraLarge' => imageLinks.extraLarge,
        _ => null,
      };
      if (url != null && url.isNotEmpty) return url;
    }
    return null;
  }
}
