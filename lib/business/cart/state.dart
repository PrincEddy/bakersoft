import 'package:bakersoft/model/cart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
@freezed
abstract class CartState with _$CartState {
  const factory CartState({@Default([]) List<Cart> carts})= Initial;
  const factory CartState.cartLoading()=CartLoading;
  const factory CartState.cartLoaded(List<Cart> carts,double total)=CartLoaded;
  const factory CartState.cartFailed(String error)= CartFailed;
}