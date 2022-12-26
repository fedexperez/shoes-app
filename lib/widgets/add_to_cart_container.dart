import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/widgets.dart';

class AddToCartContainer extends StatelessWidget {
  final double price;

  const AddToCartContainer({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Text(
            '\$$price',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const RoundedColorButton(
            text: 'Add to cart',
          )
        ],
      ),
    );
  }
}
