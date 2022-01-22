import 'package:bakersoft/business/cart/bloc.dart';
import 'package:bakersoft/business/cart/event.dart';
import 'package:bakersoft/business/productDetail/bloc.dart';
import 'package:bakersoft/business/productDetail/event.dart';
import 'package:bakersoft/business/productDetail/state.dart';
import 'package:bakersoft/constants.dart';
import 'package:bakersoft/model/product.dart';
import 'package:bakersoft/pages/product/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              ///Header
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
              BlocBuilder<ProductDetailBloc,ProductDetailState>(
                builder: (context,state) {
               return   state.when(() => SizedBox(), selected: (selected,product,total,cartDetails)=> Expanded(
                 child: Column(
                   children: [
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
                                                Container(
                                                  //color:primaryColor.shade500,
                                                  child: Image(
                                                      height: 200.h,
                                                      width: 300.w,
                                                      fit: BoxFit.contain,
                                                      image: NetworkImage(product.imgUrl)),
                                                ),
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
                                                  AddSubButton(icon: FontAwesomeIcons.minus, onTap: (){
                                                    if(cartDetails.length>0){
                                                      context.read<ProductDetailBloc>().add(AddRemoveCart(product,selected,total,cartDetails,false));
                                                    }

                                                  }),
                                                  Text("${cartDetails.length}",style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w900,
                                                  ),),
                                                  //
                                                 AddSubButton(icon: FontAwesomeIcons.plus, onTap: (){
                                                   context.read<ProductDetailBloc>().add(AddRemoveCart(product,selected,total,cartDetails,true));
                                                 })
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
                                                "${product.title}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.sp),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 3.h, bottom: 5.h),
                                                child: Text(
                                                  "${product.subTitle}",
                                                  style:  TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12.sp),
                                                ),
                                              ),
                                              Text(
                                                "${product.sign}${selected.price}",
                                                style: TextStyle(
                                                    color: primaryColor.shade500,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 14.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    ProductDetailSelection(),
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
                                           Text("${selected.cal}",style: TextStyle(
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
                                           Text("${selected.duration}",style: TextStyle(
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
                                           Text("${selected.weight}",style: TextStyle(
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
                                       child: Text(product.description,style: TextStyle(
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
                                               child: Text("${product.sign}${total.toStringAsFixed(2)}",style: TextStyle(
                                                 color: Colors.white,
                                                 fontSize: 15.sp,
                                                 fontWeight: FontWeight.bold,
                                               ),),
                                             ),
                                           ),
                                           InkWell(
                                             onTap: (){
                                               if(cartDetails.length>0) {
                                                 context.read<CartBloc>().add(
                                                     AddCart(
                                                         product, cartDetails,
                                                         total));
                                               }
                                             },
                                             child: Container(
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
               ));
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailSelection extends StatelessWidget {
  const ProductDetailSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc,ProductDetailState>(
      builder: (context,state) {
      return  state.when(() => SizedBox(), selected: (detail,product,total,cartDetails)=>     Container(
          height: 200.h,
          width: 40.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.w)
          ),
          child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: product.details.map((e) =>  InkWell(
                onTap: (){
                  if(!e.selected){
                    context.read<ProductDetailBloc>().add(SelectProductDetail(product,e,total,cartDetails));
                  }

                },
                child: Container(
                  child: Center(
                    child: Text("${e.title}",style: TextStyle(
                      color:e.selected? Colors.white:Colors.grey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:e.selected? Colors.black:Colors.white,
                  ),
                  width: 30.w,
                  height: 30.w,
                ),
              )).toList()
          ),
        ));

      }
    );
  }
}

class AddSubButton extends StatelessWidget {
  const AddSubButton({Key? key,required this.icon,required this.onTap}) : super(key: key);
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Container(
        child: Icon(icon,color: Colors.white,size:15.sp,),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffFFB99E),
        ),
        width: 30.w,
        height: 30.w,
      ),
    );
  }
}