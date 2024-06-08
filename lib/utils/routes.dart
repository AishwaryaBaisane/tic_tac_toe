import 'package:flutter/material.dart';

import '../Screen/homepage.dart';

class Approutes {
  static Map<String, Widget Function(BuildContext)> routes ={
    '/':(context)=> HomePage(),
  };
}
