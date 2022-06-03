import 'package:flutter/material.dart';
import 'package:prestpuesta/widgets/widget.dart';

class CalculoScreen extends StatelessWidget {
  const CalculoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: CalculoLayer()),
    );
  }
}
