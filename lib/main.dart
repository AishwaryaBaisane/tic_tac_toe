import 'package:flutter/material.dart';
import 'package:tik_tak/utils/routes.dart';

void main ()
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Approutes.routes,
    );
  }
}
