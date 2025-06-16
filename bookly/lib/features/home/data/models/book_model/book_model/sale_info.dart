import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  factory SaleInfo.fromMap(Map<String, dynamic> data) => SaleInfo(
        country: data['country'] as String?,
        saleability: data['saleability'] as String?,
        isEbook: data['isEbook'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
      };

  @override
  List<Object?> get props => [country, saleability, isEbook];
}
