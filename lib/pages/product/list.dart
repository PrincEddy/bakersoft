import 'package:badges/badges.dart';
import 'package:bakersoft/constants.dart';
import 'package:bakersoft/pages/cart/list.dart';
import 'package:bakersoft/pages/product/view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        padding: EdgeInsets.symmetric( horizontal: 30.w),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CartItem(),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        child: Text(
                            "Welcome to BakerSoft's Cakes. \nWhat would you like to eat today",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),),
                      width: 50.w,
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProductItem(),
                        SizedBox(
                          width: 20.w,
                        ),
                        ProductItem(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProductItem(),
                        SizedBox(
                          width: 20.w,
                        ),
                        ProductItem(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProductItem(),
                        SizedBox(
                          width: 20.w,
                        ),
                        ProductItem(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String imgUrl =
    "https://www.fabmood.com/inspiration/wp-content/uploads/2019/09/wedding-cake-3.jpg";

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductView()));
        },
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          height: 200.h,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          imgUrl,
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
                            "Special Wedding Cake",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                            child: Text(
                              "Flavor:Cream",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp),
                            ),
                          ),
                          Text(
                            "\$250.00",
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
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CartList()));
      },
      child: Badge(
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
      ),
    );
  }
}