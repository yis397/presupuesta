import 'package:flutter/material.dart';
import 'package:prestpuesta/widgets/widget.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: LayoutMat()),
    );
  }
}
