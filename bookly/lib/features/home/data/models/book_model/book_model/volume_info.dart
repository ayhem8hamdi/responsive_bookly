import 'package:bookly/core/utils/image_loader_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class IndustryIdentifier extends Equatable {
  final String? type;
  final String? identifier;

  const IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromMap(Map<String, dynamic> data) =>
      IndustryIdentifier(
        type: data['type'] as String?,
        identifier: data['identifier'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'identifier': identifier,
      };

  @override
  List<Object?> get props => [type, identifier];
}

class ReadingModes extends Equatable {
  final bool? text;
  final bool? image;

  const ReadingModes({this.text, this.image});

  factory ReadingModes.fromMap(Map<String, dynamic> data) => ReadingModes(
        text: data['text'] as bool?,
        image: data['image'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'text': text,
        'image': image,
      };

  @override
  List<Object?> get props => [text, image];
}

class PanelizationSummary extends Equatable {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  const PanelizationSummary(
      {this.containsEpubBubbles, this.containsImageBubbles});

  factory PanelizationSummary.fromMap(Map<String, dynamic> data) =>
      PanelizationSummary(
        containsEpubBubbles: data['containsEpubBubbles'] as bool?,
        containsImageBubbles: data['containsImageBubbles'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'containsEpubBubbles': containsEpubBubbles,
        'containsImageBubbles': containsImageBubbles,
      };

  @override
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}

class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;
  final String? small;
  final String? medium;
  final String? large;
  final String? extraLarge;

  const ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
    this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  factory ImageLinks.fromMap(Map<String, dynamic> data) => ImageLinks(
        smallThumbnail: _sanitizeImageUrl(data['smallThumbnail'] as String?),
        thumbnail: _sanitizeImageUrl(data['thumbnail'] as String?),
        small: _sanitizeImageUrl(data['small'] as String?),
        medium: _sanitizeImageUrl(data['medium'] as String?),
        large: _sanitizeImageUrl(data['large'] as String?),
        extraLarge: _sanitizeImageUrl(data['extraLarge'] as String?),
      );

  static String? _sanitizeImageUrl(String? url) {
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

  Future<ImageLinks> processUrls(ImageLoaderService imageLoader) async {
    final processed = await Future.wait([
      _processUrl(smallThumbnail, imageLoader),
      _processUrl(thumbnail, imageLoader),
      _processUrl(small, imageLoader),
      _processUrl(medium, imageLoader),
      _processUrl(large, imageLoader),
      _processUrl(extraLarge, imageLoader),
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

  Future<String?> _processUrl(
      String? url, ImageLoaderService imageLoader) async {
    if (url == null) return null;

    final result = await imageLoader.getLoadableImageUrl(url);
    return result.fold(
      (failure) {
        debugPrint('Failed to process image URL: ${failure.message}');
        return url; // Return original if processing fails
      },
      (processedUrl) => processedUrl,
    );
  }

  String? getBestImageUrl() {
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
        'thumbnail' => thumbnail,
        'small' => small,
        'medium' => medium,
        'smallThumbnail' => smallThumbnail,
        'large' => large,
        'extraLarge' => extraLarge,
        _ => null,
      };
      if (url != null && url.isNotEmpty) return url;
    }
    return null;
  }

  String getPlaceholderImageUrl(String bookTitle, String? author) {
    final seed = '${bookTitle}_${author ?? 'unknown'}'.hashCode.abs();
    return 'https://picsum.photos/seed/$seed/300/400';
  }

  Map<String, dynamic> toMap() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
        'small': small,
        'medium': medium,
        'large': large,
        'extraLarge': extraLarge,
      };

  @override
  List<Object?> get props => [
        smallThumbnail,
        thumbnail,
        small,
        medium,
        large,
        extraLarge,
      ];
}

class VolumeInfo extends Equatable {
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromMap(Map<String, dynamic> data) => VolumeInfo(
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        authors: (data['authors'] as List<dynamic>?)?.cast<String>(),
        publisher: data['publisher'] as String?,
        publishedDate: data['publishedDate'] as String?,
        description: data['description'] as String?,
        industryIdentifiers: (data['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) => IndustryIdentifier.fromMap(e as Map<String, dynamic>))
            .toList(),
        readingModes: data['readingModes'] == null
            ? null
            : ReadingModes.fromMap(
                data['readingModes'] as Map<String, dynamic>),
        pageCount: data['pageCount'] as int?,
        printType: data['printType'] as String?,
        categories: (data['categories'] as List<dynamic>?)?.cast<String>(),
        averageRating: (data['averageRating'] as num?)?.toDouble(),
        ratingsCount: data['ratingsCount'] as int?,
        maturityRating: data['maturityRating'] as String?,
        allowAnonLogging: data['allowAnonLogging'] as bool?,
        contentVersion: data['contentVersion'] as String?,
        panelizationSummary: data['panelizationSummary'] == null
            ? null
            : PanelizationSummary.fromMap(
                data['panelizationSummary'] as Map<String, dynamic>),
        imageLinks: data['imageLinks'] == null
            ? null
            : ImageLinks.fromMap(data['imageLinks'] as Map<String, dynamic>),
        language: data['language'] as String?,
        previewLink: data['previewLink'] as String?,
        infoLink: data['infoLink'] as String?,
        canonicalVolumeLink: data['canonicalVolumeLink'] as String?,
      );

  String? getImageUrl() => imageLinks?.getBestImageUrl();

  String getFallbackImageUrl() =>
      imageLinks?.getPlaceholderImageUrl(
        title ?? 'Unknown Title',
        authors?.isNotEmpty == true ? authors!.first : null,
      ) ??
      'https://picsum.photos/300/400';

  String getDisplayImageUrl() => getImageUrl() ?? getFallbackImageUrl();

  Future<VolumeInfo> processImageUrls(ImageLoaderService imageLoader) async {
    if (imageLinks == null) return this;

    final processedImageLinks = await imageLinks!.processUrls(imageLoader);
    return VolumeInfo(
      title: title,
      subtitle: subtitle,
      authors: authors,
      publisher: publisher,
      publishedDate: publishedDate,
      description: description,
      industryIdentifiers: industryIdentifiers,
      readingModes: readingModes,
      pageCount: pageCount,
      printType: printType,
      categories: categories,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      maturityRating: maturityRating,
      allowAnonLogging: allowAnonLogging,
      contentVersion: contentVersion,
      panelizationSummary: panelizationSummary,
      imageLinks: processedImageLinks,
      language: language,
      previewLink: previewLink,
      infoLink: infoLink,
      canonicalVolumeLink: canonicalVolumeLink,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'industryIdentifiers':
            industryIdentifiers?.map((e) => e.toMap()).toList(),
        'readingModes': readingModes?.toMap(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'panelizationSummary': panelizationSummary?.toMap(),
        'imageLinks': imageLinks?.toMap(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };

  @override
  List<Object?> get props => [
        title,
        subtitle,
        authors,
        publisher,
        publishedDate,
        description,
        industryIdentifiers,
        readingModes,
        pageCount,
        printType,
        categories,
        averageRating,
        ratingsCount,
        maturityRating,
        allowAnonLogging,
        contentVersion,
        panelizationSummary,
        imageLinks,
        language,
        previewLink,
        infoLink,
        canonicalVolumeLink,
      ];
}
