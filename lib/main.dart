import 'package:bakersoft/constants.dart';
import 'package:bakersoft/pages/product/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 736),
      builder: () {
        return MaterialApp(
          title: "Baker Soft",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch:primaryColor,
          ),
          home:ProductList(),
        );
      }
    );
  }
}
class BakerSoft extends StatefulWidget {
  const BakerSoft({Key? key}) : super(key: key);

  @override
  _BakerSoftState createState() => _BakerSoftState();
}

class _BakerSoftState extends State<BakerSoft> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baker Soft"),

      ),
      backgroundColor: backgroundColor,
      body: Container(),
    );
  }
}