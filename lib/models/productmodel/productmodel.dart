import 'package:collection/collection.dart';

import 'product.dart';

class Productmodel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  Productmodel({this.products, this.total, this.skip, this.limit});

  factory Productmodel.fromJson(Map<String, dynamic> json) => Productmodel(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        skip: json['skip'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Productmodel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      products.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
}
