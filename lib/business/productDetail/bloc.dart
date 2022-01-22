
import 'package:bakersoft/business/productDetail/event.dart';
import 'package:bakersoft/business/productDetail/state.dart';
import 'package:bakersoft/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent,ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailState());

  @override
  Stream<ProductDetailState> mapEventToState(event) {
    return event.when(selectProductDetail: (Product product,ProductDetail? detail,double? total, List<ProductDetail>? cartDetails) async* {
      List<ProductDetail> details = product.details.where((element) => element.selected).toList();
      if(detail!=null) {
        product.details[product.details.indexOf(details[0])]=details[0].copyWith(selected: false);
       int index =  product.details.indexOf(detail);
        product.details[index] =
            product.details[index].copyWith(
                selected: true);

        if(cartDetails==null){
          cartDetails= [ product.details[index]];
          total = product.details[index].price;
        }

        yield ProductDetailState.selected( product.details[index], product,total??0.0,cartDetails);
      } else {

       if(details.length==0){
         detail = product.details[0].copyWith(selected: true);
         product.details[0]=detail;
       }else {
         detail =details[0];
       }

       yield ProductDetailState.selected(detail, product,total??0,cartDetails??[]);
      }


    },addRemoveCart: (Product product,ProductDetail detail,double total, List<ProductDetail> cartDetails,bool add) async*{
      if(add){
        total+=detail.price;
        cartDetails.add(detail);
      }  else {
        total-=detail.price;
        int index = product.details.indexOf(detail);
        product.details[index]=detail.copyWith(selected: false);
        cartDetails.remove(detail);
        if(cartDetails.length>=1) {
          detail = cartDetails[cartDetails.length - 1];
        }
        int currentIndex =getCurrentIndex(detail, product);
        detail= detail.copyWith(selected: true);
        product.details[currentIndex]=detail;
      }
      total= double.parse(total.toStringAsFixed(2));
      yield ProductDetailState.selected(detail, product,total,cartDetails);
    });
  }


  int getCurrentIndex(ProductDetail detail,Product product){
    for(int i=0;i<product.details.length;i++){
      if(detail.title==product.details[i].title){
        return i;
      }
    }
    return 0;
  }
}