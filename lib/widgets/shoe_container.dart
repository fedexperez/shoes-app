import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/shoe_model.dart';

class ShoeContainer extends StatelessWidget {
  const ShoeContainer({
    super.key,
    this.horizontalMargin = 30,
    this.verticalMargin = 20,
    this.fullscreen = false,
  });

  final double horizontalMargin;
  final double verticalMargin;
  final bool fullscreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullscreen) {
          Navigator.pushNamed(context, 'shoe');
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: verticalMargin,
        ),
        height: (fullscreen) ? 410 : 400,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const _ShoeAndShadow(),
            if (!fullscreen) const _ShoeSizes(),
          ],
        ),
      ),
    );
  }
}

class _ShoeAndShadow extends StatelessWidget {
  const _ShoeAndShadow();

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(bottom: 20, right: 0, child: _ShoeShadow()),
          Image(image: AssetImage(shoeModel.getShoeImage)),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 225,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                blurStyle: BlurStyle.normal,
                blurRadius: 20)
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ShoeSizeButton(shoeSize: 7),
          _ShoeSizeButton(shoeSize: 7.5),
          _ShoeSizeButton(shoeSize: 8),
          _ShoeSizeButton(shoeSize: 8.5),
          _ShoeSizeButton(shoeSize: 9),
          _ShoeSizeButton(shoeSize: 9.5),
        ],
      ),
    );
  }
}

class _ShoeSizeButton extends StatelessWidget {
  const _ShoeSizeButton({
    required this.shoeSize,
  });

  final double shoeSize;

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.setShoeSize = shoeSize;
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            if (shoeSize == shoeModel.getShoeSize)
              const BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
          color: (shoeSize == shoeModel.getShoeSize)
              ? const Color(0xffF1A23A)
              : Colors.white,
        ),
        alignment: Alignment.center,
        child: Text(
          shoeSize.toString().replaceAll('.0', ''),
          style: (shoeSize == shoeModel.getShoeSize)
              ? const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              : TextStyle(
                  color: Colors.amber.shade700,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
        ),
      ),
    );
  }
}
