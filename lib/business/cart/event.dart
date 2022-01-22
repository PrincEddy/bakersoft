import 'package:bakersoft/model/cart.dart';
import 'package:bakersoft/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class CartEvent with _$CartEvent {
  const factory CartEvent.loadCarts()=LoadCarts;
  const factory CartEvent.cartsLoaded(List<Cart> carts,double total)= CartsLoaded;
  const factory CartEvent.addCart(Product product,List<ProductDetail> details,double total)=AddCart;
}