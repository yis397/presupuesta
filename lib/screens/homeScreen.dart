// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeLayout(),
    );
  }
}
