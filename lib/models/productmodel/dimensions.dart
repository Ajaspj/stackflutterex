import 'package:collection/collection.dart';

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: (json['width'] as num?)?.toDouble(),
        height: (json['height'] as num?)?.toDouble(),
        depth: (json['depth'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
        'depth': depth,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Dimensions) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ depth.hashCode;
}
