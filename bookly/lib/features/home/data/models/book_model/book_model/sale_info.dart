import 'package:equatable/equatable.dart';

class ListPrice extends Equatable {
  final double? amount;
  final String? currencyCode;

  const ListPrice({
    this.amount,
    this.currencyCode,
  });

  factory ListPrice.fromMap(Map<String, dynamic> data) => ListPrice(
        amount: (data['amount'] as num?)?.toDouble(),
        currencyCode: data['currencyCode'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };

  @override
  List<Object?> get props => [amount, currencyCode];
}

class RetailPrice extends Equatable {
  final double? amount;
  final String? currencyCode;

  const RetailPrice({
    this.amount,
    this.currencyCode,
  });

  factory RetailPrice.fromMap(Map<String, dynamic> data) => RetailPrice(
        amount: (data['amount'] as num?)?.toDouble(),
        currencyCode: data['currencyCode'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };

  @override
  List<Object?> get props => [amount, currencyCode];
}

class Offer extends Equatable {
  final int? finskyOfferType;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;
  final bool? giftable;

  const Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
    this.giftable,
  });

  factory Offer.fromMap(Map<String, dynamic> data) => Offer(
        finskyOfferType: data['finskyOfferType'] as int?,
        listPrice: data['listPrice'] == null
            ? null
            : ListPrice.fromMap(data['listPrice'] as Map<String, dynamic>),
        retailPrice: data['retailPrice'] == null
            ? null
            : RetailPrice.fromMap(data['retailPrice'] as Map<String, dynamic>),
        giftable: data['giftable'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'finskyOfferType': finskyOfferType,
        'listPrice': listPrice?.toMap(),
        'retailPrice': retailPrice?.toMap(),
        'giftable': giftable,
      };

  @override
  List<Object?> get props =>
      [finskyOfferType, listPrice, retailPrice, giftable];
}

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromMap(Map<String, dynamic> data) => SaleInfo(
        country: data['country'] as String?,
        saleability: data['saleability'] as String?,
        isEbook: data['isEbook'] as bool?,
        listPrice: data['listPrice'] == null
            ? null
            : ListPrice.fromMap(data['listPrice'] as Map<String, dynamic>),
        retailPrice: data['retailPrice'] == null
            ? null
            : RetailPrice.fromMap(data['retailPrice'] as Map<String, dynamic>),
        buyLink: data['buyLink'] as String?,
        offers: (data['offers'] as List<dynamic>?)
            ?.map((e) => Offer.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
        'listPrice': listPrice?.toMap(),
        'retailPrice': retailPrice?.toMap(),
        'buyLink': buyLink,
        'offers': offers?.map((e) => e.toMap()).toList(),
      };

  @override
  List<Object?> get props =>
      [country, saleability, isEbook, listPrice, retailPrice, buyLink, offers];
}
