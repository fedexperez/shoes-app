import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/widgets.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomAppBar(
            title: 'For You',
          ),
          ShoeContainer(
            horizontalMargin: 30,
            verticalMargin: 20,
          ),
        ],
      ),
    );
  }
}
