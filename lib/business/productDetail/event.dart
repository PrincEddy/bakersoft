import 'package:bakersoft/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.selectProductDetail(Product product,[ProductDetail? currentDetail,double? total,List<ProductDetail>? cartDetails])= SelectProductDetail;
  const factory ProductDetailEvent.addRemoveCart(Product product,ProductDetail currentDetail,double total,List<ProductDetail> cartDetails,bool add)=AddRemoveCart;
}