import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Baker Soft",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BakerSoft(),
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
      body: Container(),
    );
  }
}