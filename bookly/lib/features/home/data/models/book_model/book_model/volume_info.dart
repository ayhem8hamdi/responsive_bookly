import 'package:equatable/equatable.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final String? language;

  const VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.language,
  });

  factory VolumeInfo.fromMap(Map<String, dynamic> data) => VolumeInfo(
        title: data['title'] as String?,
        authors: (data['authors'] as List<dynamic>?)?.cast<String>(),
        publisher: data['publisher'] as String?,
        publishedDate: data['publishedDate'] as String?,
        description: data['description'] as String?,
        pageCount: data['pageCount'] as int?,
        categories: (data['categories'] as List<dynamic>?)?.cast<String>(),
        averageRating: (data['averageRating'] as num?)?.toDouble(),
        ratingsCount: data['ratingsCount'] as int?,
        maturityRating: data['maturityRating'] as String?,
        language: data['language'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'pageCount': pageCount,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'maturityRating': maturityRating,
        'language': language,
      };

  @override
  List<Object?> get props => [
        title,
        authors,
        publisher,
        publishedDate,
        description,
        pageCount,
        categories,
        averageRating,
        ratingsCount,
        maturityRating,
        language,
      ];
}
