import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgressWidget extends StatelessWidget {
  const CustomProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Colors.white,
      size: 50.0,
    );
  }
}
