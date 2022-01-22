import 'package:bakersoft/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed

abstract class ProductState with _$ProductState {
  const factory ProductState({@Default([]) List<Product> products}) = Inital;
  const factory ProductState.loading() = Loading;
  const factory ProductState.success(List<Product> products)= Success;
  const factory ProductState.failure(String message)= Failure;
}