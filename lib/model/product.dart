import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
 part 'product.freezed.dart';
 part 'product.g.dart';

@freezed

abstract class Product with _$Product {
  factory Product({
    @JsonKey(name: "title",required: true,defaultValue: "") required String title,
    @JsonKey(name: "subTitle",required: true,defaultValue: "") required String subTitle,
    @JsonKey(name: "sign",required: true,defaultValue: "\$") required String sign,
    @JsonKey(name: "description",required: true,defaultValue: "") required String description,
    @JsonKey(name: "displayPrice",required: true,defaultValue: 0.0) required double displayPrice,
    @JsonKey(name: "id",required: true,defaultValue: "") required String id,
    @JsonKey(name: "imgUrl",required: true,defaultValue: "") required String imgUrl,
    @JsonKey(name: "details",required: true,defaultValue: []) required List<ProductDetail> details
  })=_Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
abstract class ProductDetail with _$ProductDetail {
  factory ProductDetail({
    @JsonKey(name: "title",required: true,defaultValue: "") required String title,
    @JsonKey(name: "cal",required: true,defaultValue: "") required String cal,
    @JsonKey(name: "weight",required: true,defaultValue: "") required String weight ,
    @JsonKey(name: "duration",required: true,defaultValue: "") required String duration,
    @JsonKey(name: "price",required: true,defaultValue: 0.0) required double price,
  })=_ProductDetail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
}