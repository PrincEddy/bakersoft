import 'dart:async';

import 'package:bakersoft/model/cart.dart';
import 'package:bakersoft/model/product.dart';
import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartBloc() : super(CartState());
  final cartCollection = FirebaseFirestore.instance.collection('cart');
  StreamSubscription? streamSubscription;
  @override
  Stream<CartState> mapEventToState(event) {
    return event.when(loadCarts: () async* {
      try {
        yield CartState.cartLoading();
        streamSubscription?.cancel();
        streamSubscription= cartCollection.snapshots().listen((event) {
          double total=0;
          List<Cart> carts =  event.docs.map((e){
            Map<String,dynamic> data = e.data();
            data['cartID']=e.id;
            Cart cart= Cart.fromJson(data);
            total+=cart.total;
            return cart;
          }).toList();
          add(CartsLoaded(carts,total));

        });
      } catch (error) {
        yield CartState.cartFailed(error.toString());
      }
    },cartsLoaded:(carts,total) async*{
      yield CartState.cartLoaded(carts,total);
    },addCart:(product,details,total) async*{
   Product myProduct =  product.copyWith(details: details);
      Cart cart = Cart(total: total, id: "", product: myProduct);
   Map<String,dynamic> cartJson=   cart.toJson();
   Map<String,dynamic> productJson = myProduct.toJson();
   List<Map<String,dynamic>> detailsJson = details.map((e) => e.toJson()).toList();
   productJson['details']=detailsJson;
   cartJson['product']=productJson;
     await cartCollection.add(cartJson);
     add(LoadCarts());
    });
  }


}