import 'package:bakersoft/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';


@freezed
abstract class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState()=Initial;
  const factory ProductDetailState.selected(ProductDetail selectedProductDetail,Product product,double total,List<ProductDetail> cartProductDetails)= Selected;

}