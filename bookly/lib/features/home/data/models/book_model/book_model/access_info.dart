import 'package:equatable/equatable.dart';

class EpubInfo extends Equatable {
  final bool? isAvailable;
  final String? acsTokenLink;
  final String? downloadLink;

  const EpubInfo({
    this.isAvailable,
    this.acsTokenLink,
    this.downloadLink,
  });

  factory EpubInfo.fromMap(Map<String, dynamic> data) => EpubInfo(
        isAvailable: data['isAvailable'] as bool?,
        acsTokenLink: data['acsTokenLink'] as String?,
        downloadLink: data['downloadLink'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
        'downloadLink': downloadLink,
      };

  @override
  List<Object?> get props => [isAvailable, acsTokenLink, downloadLink];
}

class PdfInfo extends Equatable {
  final bool? isAvailable;
  final String? acsTokenLink;
  final String? downloadLink;

  const PdfInfo({
    this.isAvailable,
    this.acsTokenLink,
    this.downloadLink,
  });

  factory PdfInfo.fromMap(Map<String, dynamic> data) => PdfInfo(
        isAvailable: data['isAvailable'] as bool?,
        acsTokenLink: data['acsTokenLink'] as String?,
        downloadLink: data['downloadLink'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
        'downloadLink': downloadLink,
      };

  @override
  List<Object?> get props => [isAvailable, acsTokenLink, downloadLink];
}

class AccessInfo extends Equatable {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final EpubInfo? epub;
  final PdfInfo? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  const AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromMap(Map<String, dynamic> data) => AccessInfo(
        country: data['country'] as String?,
        viewability: data['viewability'] as String?,
        embeddable: data['embeddable'] as bool?,
        publicDomain: data['publicDomain'] as bool?,
        textToSpeechPermission: data['textToSpeechPermission'] as String?,
        epub: data['epub'] == null
            ? null
            : EpubInfo.fromMap(data['epub'] as Map<String, dynamic>),
        pdf: data['pdf'] == null
            ? null
            : PdfInfo.fromMap(data['pdf'] as Map<String, dynamic>),
        webReaderLink: data['webReaderLink'] as String?,
        accessViewStatus: data['accessViewStatus'] as String?,
        quoteSharingAllowed: data['quoteSharingAllowed'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'country': country,
        'viewability': viewability,
        'embeddable': embeddable,
        'publicDomain': publicDomain,
        'textToSpeechPermission': textToSpeechPermission,
        'epub': epub?.toMap(),
        'pdf': pdf?.toMap(),
        'webReaderLink': webReaderLink,
        'accessViewStatus': accessViewStatus,
        'quoteSharingAllowed': quoteSharingAllowed,
      };

  @override
  List<Object?> get props => [
        country,
        viewability,
        embeddable,
        publicDomain,
        textToSpeechPermission,
        epub,
        pdf,
        webReaderLink,
        accessViewStatus,
        quoteSharingAllowed,
      ];
}
