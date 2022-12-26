import 'package:flutter/material.dart';

class RoundedColorButton extends StatelessWidget {
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final Color color;

  const RoundedColorButton({
    super.key,
    required this.text,
    this.horizontalPadding = 30,
    this.verticalPadding = 15,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      elevation: 0,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
    );

    return ElevatedButton(
      onPressed: () {},
      style: style,
      child: Text(text),
    );
  }
}
