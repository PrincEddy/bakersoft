import 'package:badges/badges.dart';
import 'package:bakersoft/business/cart/bloc.dart';
import 'package:bakersoft/business/cart/event.dart';
import 'package:bakersoft/business/cart/state.dart';
import 'package:bakersoft/business/product/bloc.dart';
import 'package:bakersoft/business/product/event.dart';
import 'package:bakersoft/business/product/state.dart';
import 'package:bakersoft/business/productDetail/bloc.dart';
import 'package:bakersoft/business/productDetail/event.dart';
import 'package:bakersoft/constants.dart';
import 'package:bakersoft/model/product.dart';
import 'package:bakersoft/pages/cart/list.dart';
import 'package:bakersoft/pages/product/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}


class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductBloc>().add(LoadProducts());
    context.read<CartBloc>().add(LoadCarts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        padding: EdgeInsets.symmetric( horizontal: 20.w),
        child: SafeArea(
          child: Column(
            children: [
             Header(),
              Expanded(
                child: BlocBuilder<ProductBloc,ProductState>(
                  builder: (context,state) {
                    return state.when((products) => SizedBox(),
                        loading:()=>Center(
                          child: CircularProgressIndicator(color: primaryColor.shade50,),
                        ),
                        success:(products)=> GridView.builder(
                          itemCount: products.length,
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.91,
                          crossAxisSpacing: 10.w,
                            crossAxisCount:2), itemBuilder:(context,index){
                          return  ProductItem(product: products[index],);
                        }),
                        failure:(message)=>Center(child: Text("$message",style: TextStyle(
                          color: Colors.red
                        ),))
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProductItem extends StatelessWidget {
  const ProductItem({Key? key,required this.product}) : super(key: key);
final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProductDetailBloc>().add(SelectProductDetail(product));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductView()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        height: 250.h,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        product.imgUrl,
                      )),
                  color: primaryColor.shade500.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.w),
                      topLeft: Radius.circular(10.w)),
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.w),
                    bottomRight: Radius.circular(10.w)),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.title}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                          child: Text(
                            "${product.subTitle}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp),
                          ),
                        ),
                        Text(
                          "${product.sign}${product.displayPrice}",
                          style: TextStyle(
                              color: primaryColor.shade500,
                              fontWeight: FontWeight.w900,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                            color: primaryColor.shade500,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.w),
                                topLeft: Radius.circular(10.w))),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc,CartState>(
      builder: (context,state) {
       return state.maybeWhen((carts) => InkWell(
         onTap: () {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => CartList()));
         },
         child: Badge(
           badgeColor: Colors.black,
           badgeContent: Text(
             '${carts.length}',
             style: TextStyle(
               color: Colors.white,
             ),
           ),
           child: Icon(
             FontAwesomeIcons.shoppingCart,
             color: primaryColor.shade500,
             size: 30.sp,
           ),
         ),
       ),cartLoaded: (carts,total)=>InkWell(
         onTap: () {
           Navigator.push(
               context, MaterialPageRoute(builder: (context) => CartList()));
         },
         child: Badge(
           badgeColor: Colors.black,
           badgeContent: Text(
             '${carts.length}',
             style: TextStyle(
               color: Colors.white,
             ),
           ),
           child: Icon(
             FontAwesomeIcons.shoppingCart,
             color: primaryColor.shade500,
             size: 30.sp,
           ),
         ),
       ), orElse: ()=>Badge(
         badgeColor: Colors.black,
         badgeContent: Text(
           '0',
           style: TextStyle(
             color: Colors.white,
           ),
         ),
         child: Icon(
           FontAwesomeIcons.shoppingCart,
           color: primaryColor.shade500,
           size: 30.sp,
         ),
       ));
      }
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CartItem(),
          ],
        ),
        Container(
          child: Text(
            "Welcome to BakerSoft's Cakes. What would you like to eat today",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),),
          width: 280.w,
          margin: EdgeInsets.symmetric(vertical: 20.h),
        ),
      ],
    );
  }
}