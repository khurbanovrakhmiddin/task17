import 'package:equatable/equatable.dart';

class StockResponse extends Equatable {
  final List<StockData> data;
  final Meta meta;

  const StockResponse({required this.data, required this.meta});
   StockResponse empty(){
    return const StockResponse(data: [], meta:   Meta(count: 0));
  }
  factory StockResponse.fromJson(Map<String, dynamic> json) {
    return StockResponse(
      data: (json['data'] as List).map((e) => StockData.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }

  @override
  List<Object?> get props => [data, meta];
}

class StockData extends Equatable {
  final int id;
  final String companyName;
  final String tradingSymbol;
  final String logo;
  final String currency;
  final bool shariahCheck;
  final String analysisDate;
  final bool isCompliant;
  final Price price;

  StockData({
    required this.id,
    required this.companyName,
    required this.tradingSymbol,
    required this.logo,
    required this.currency,
    required this.shariahCheck,
    required this.analysisDate,
    required this.isCompliant,
    required this.price,
  });

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      id: json['id'],
      companyName: json['companyName'],
      tradingSymbol: json['tradingSymbol'],
      logo: json['logo'],
      currency: json['currency'],
      shariahCheck: json['shariahCheck'],
      analysisDate: json['analysisDate'],
      isCompliant: json['isCompliant'],
      price: Price.fromJson(json['price']),
    );
  }

  @override
  List<Object?> get props => [id, isCompliant, companyName, currency, logo];
}

class Price extends Equatable {
  final double price;
  final double changePercent;

  Price({required this.price, required this.changePercent});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      price: (json['price'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
    );
  }

  @override
  List<Object?> get props => [price, changePercent];
}

class Meta extends Equatable {
  final int count;

  const Meta({required this.count});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(count: json['count']);
  }

  @override
  List<Object?> get props => [count];
}
