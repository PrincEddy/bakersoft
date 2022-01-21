import 'package:bakersoft/constants.dart';
import 'package:bakersoft/pages/product/list.dart';
import 'package:bakersoft/pages/product/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        child:   Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 30.h),
                margin:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,color: Colors.black,size: 30.w,)),
                    Text("My Cart",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(),

                  ],),
              ),
              Expanded(
                child: Column(
                  children: [
                    CartItem(),
                    CartItem(),
                    CartItem(),
                    CartItem(),
                  ],
                ),
              ),
              Container(
                height: 90.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor.shade500,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.w),topRight: Radius.circular(40.w))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Container(
                      width: 150.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.w),
                        color: Color(0xffFF9A73),
                      ),
                      child: Center(
                        child: Text("\$ 250.00",style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                    Container(
                      width: 150.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.w),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text("Checkout",style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ],
                ),
              )

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
    return Container(
      margin: EdgeInsets.only(top: 10.h,left: 20.w,right: 20.w),
      padding: EdgeInsets.symmetric(vertical:10.h,horizontal: 20.w),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.w),
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imgUrl,
                  )
              ),
              color: primaryColor.shade500.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Special Wedding Cake",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp),
              ),
              SizedBox(height: 5.h,),
              Text(
                "\$250.00",
                style: TextStyle(
                    color: primaryColor.shade500,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.sp),
              ),
            ],
          ),
          Container(
            width: 25.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.w),
              color: primaryColor.shade500,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Icon(FontAwesomeIcons.minus,color: Colors.white,size:10.sp,),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFB99E),
                  ),
                  width: 20.w,
                  height: 20.w,
                ),
                Text("1",style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900,
                ),),
                Container(
                  child: Icon(FontAwesomeIcons.plus,color: Colors.white,size:10.sp,),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFB99E),
                  ),
                  width: 20.w,
                  height: 20.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}