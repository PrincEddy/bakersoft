import 'package:bakersoft/constants.dart';
import 'package:bakersoft/pages/product/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              Container(
                margin:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back,color: Colors.black,size: 30.w,)),
                    CartItem(),

                ],),
              ),
              Expanded(
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 20.h),
                  margin: EdgeInsets.only(top: 20.h,),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(),
                          Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Column(
                                    children: [
                                      Image(
                                        height: 200.h,
                                          width: 300.w,
                                          fit: BoxFit.contain,
                                          image: NetworkImage(imgUrl)),
                                      SizedBox(height: 40,),
                                    ],
                                  ),
                                  Positioned(child: Container(
                                    width: 150.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.w),
                                      color: primaryColor.shade500,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Icon(FontAwesomeIcons.minus,color: Colors.white,size:14.sp,),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffFFB99E),
                                          ),
                                          width: 30.w,
                                          height: 30.w,
                                        ),
                                        Text("1",style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w900,
                                        ),),
                                        Container(
                                          child: Icon(FontAwesomeIcons.plus,color: Colors.white,size:15.sp,),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffFFB99E),
                                          ),
                                          width: 30.w,
                                          height: 30.w,
                                        ),
                                      ],
                                    ),
                                  ),bottom: 0,),

                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child:
                                Column(
                                  children: [
                                    Text(
                                      "Special Wedding Cake",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                                      child: Text(
                                        "Flavor:Cream",
                                        style:  TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Container(
                            height: 200.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.w)
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Center(
                                    child: Text("S",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                  width: 30.w,
                                  height: 30.w,
                                ),
                                Container(
                                  child: Center(
                                    child: Text("M",style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  width: 30.w,
                                  height: 30.w,
                                ),
                                Container(
                                  child: Center(
                                    child: Text("L",style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    ),),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  width: 30.w,
                                  height: 30.w,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor.shade500,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.w),topRight: Radius.circular(40.w))
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex:1,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.w),topRight: Radius.circular(40.w))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Container(
                              child: Column(
                                children:
                              [
                                Icon(FontAwesomeIcons.fire,color: primaryColor.shade500,size: 35.sp,),
                                SizedBox(height: 5.h,),
                                Text("180 Cal",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),)
                              ],),
                            ),
                            Container(
                              child: Column(
                                children:
                                [
                                  Icon(FontAwesomeIcons.solidClock,color: primaryColor.shade500,size: 35.sp,),
                                  SizedBox(height: 5.h,),
                                  Text("40 - 50 Min",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),)
                                ],),
                            ),
                            Container(
                              child: Column(
                                children:
                                [
                                  Icon(FontAwesomeIcons.weight,color: primaryColor.shade500,size: 35.sp,),
                                  SizedBox(height: 5.h,),
                                  Text("3KG",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),)
                                ],),
                            ),

                        ],),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(description,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                                Container(
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
                                          child: Text("Add To Cart",style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String description = "This cake is the best in town you would love to have a peace of it weather small, medium or large this is a great oppunity to test something new";