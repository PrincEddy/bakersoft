import 'package:bakersoft/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProducts()= LoadProducts;
  const factory ProductEvent.onError()= OnError;
  const factory ProductEvent.productsLoaded(List<Product> products)= ProductsLoaded;
}