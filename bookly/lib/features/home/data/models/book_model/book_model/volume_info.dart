import 'package:equatable/equatable.dart';

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
        smallThumbnail: data['smallThumbnail'] as String?,
        thumbnail: data['thumbnail'] as String?,
        small: data['small'] as String?,
        medium: data['medium'] as String?,
        large: data['large'] as String?,
        extraLarge: data['extraLarge'] as String?,
      );

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

  const PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

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

  VolumeInfo copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    List<IndustryIdentifier>? industryIdentifiers,
    ReadingModes? readingModes,
    int? pageCount,
    String? printType,
    List<String>? categories,
    double? averageRating,
    int? ratingsCount,
    String? maturityRating,
    bool? allowAnonLogging,
    String? contentVersion,
    PanelizationSummary? panelizationSummary,
    ImageLinks? imageLinks,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) {
    return VolumeInfo(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
      readingModes: readingModes ?? this.readingModes,
      pageCount: pageCount ?? this.pageCount,
      printType: printType ?? this.printType,
      categories: categories ?? this.categories,
      averageRating: averageRating ?? this.averageRating,
      ratingsCount: ratingsCount ?? this.ratingsCount,
      maturityRating: maturityRating ?? this.maturityRating,
      allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
      contentVersion: contentVersion ?? this.contentVersion,
      panelizationSummary: panelizationSummary ?? this.panelizationSummary,
      imageLinks: imageLinks ?? this.imageLinks,
      language: language ?? this.language,
      previewLink: previewLink ?? this.previewLink,
      infoLink: infoLink ?? this.infoLink,
      canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
    );
  }

  String? getDisplayImageUrl() => imageLinks?.thumbnail;
  String getFallbackImageUrl() =>
      'https://via.placeholder.com/150x224?text=No+Cover';
}
