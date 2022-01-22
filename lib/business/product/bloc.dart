import 'dart:async';

import 'package:bakersoft/model/product.dart';
import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc() : super(ProductState());
  final productCollection = FirebaseFirestore.instance.collection('product');
  StreamSubscription? streamSubscription;
  @override
  Stream<ProductState> mapEventToState(event) {
    return event.when(loadProducts: () async* {
      try {
        yield ProductState.loading();
        streamSubscription?.cancel();
        streamSubscription= productCollection.snapshots().listen((event) {
         List<Product> products =  event.docs.map((e){
           Map<String,dynamic> data = e.data();
           data['id']=e.id;
           return Product.fromJson(data);
         }).toList();
         add(ProductsLoaded(products));

        });
      } catch (error) {
        yield ProductState.failure(error.toString());
      }
    },onError:() async*{
     yield ProductState.failure("Cannot Load Data");
    },productsLoaded:(products) async*{
      yield ProductState.success(products);
    });
  }


}