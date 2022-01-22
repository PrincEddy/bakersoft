import 'package:bakersoft/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cart.freezed.dart';
part 'cart.g.dart';
@freezed

abstract class Cart with _$Cart {
  factory Cart({
    @JsonKey(name: "total",required: true,defaultValue: 0.0) required double total,
    @JsonKey(name: "cartID",required: true,defaultValue: "") required String id,
    @JsonKey(name: "product",required: true,) required Product product,

  })=_Cart;

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);
}