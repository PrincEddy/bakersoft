import 'package:bakersoft/business/product/bloc.dart';
import 'package:bakersoft/constants.dart';
import 'package:bakersoft/pages/product/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const BakerSoft());
}

class BakerSoft extends StatelessWidget {
  const BakerSoft({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 736),
      builder: () =>MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(create: (_) => ProductBloc()),
        ],
        child: MaterialApp(
            title: "Baker Soft",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch:primaryColor,
            ),
            home:ProductList(),
          ),
      )
    );
  }
}

