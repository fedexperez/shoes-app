import 'package:flutter/material.dart';

class ShoeColorButton extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;
  final Color shoeColor;

  const ShoeColorButton({
    super.key,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    required this.shoeColor,
  });

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: const Size(25, 25),
      maximumSize: const Size(45, 45),
      fixedSize: const Size(30, 30),
      backgroundColor: shoeColor,
      shape: const CircleBorder(),
      elevation: 0,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
    );

    return ElevatedButton(
      onPressed: () {},
      style: style,
      child: null,
    );
  }
}
