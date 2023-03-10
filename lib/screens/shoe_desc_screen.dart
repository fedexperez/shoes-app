import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoes_app/models/shoe_model.dart';
import 'package:shoes_app/widgets/shoe_color_button.dart';
import 'package:shoes_app/widgets/widgets.dart';

class ShoeDescScreen extends StatelessWidget {
  const ShoeDescScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const Hero(
                  tag: 'shoe-container-hero',
                  child: ShoeContainer(
                    horizontalMargin: 5,
                    verticalMargin: 5,
                    fullscreen: true,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 10,
                  child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    elevation: 0,
                    highlightElevation: 0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ShoeDescription(
                      title: 'Nike Air Max 720',
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text('\$180',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Bounce(
                            delay: Duration(seconds: 1),
                            from: 8,
                            child: RoundedColorButton(
                                text: 'Buy Now', verticalPadding: 10),
                          ),
                        ],
                      ),
                    ),
                    const _ColorsAndMore(),
                    _MoreOptionsButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreOptionsButtons extends StatelessWidget {
  _MoreOptionsButtons();

  final style = ElevatedButton.styleFrom(
    backgroundColor: Colors.grey[50],
    foregroundColor: Colors.grey[50],
    fixedSize: const Size(55, 55),
    maximumSize: const Size(45, 45),
    minimumSize: const Size(25, 25),
    shape: const CircleBorder(),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    padding: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: style,
            child: const Icon(
              Icons.star,
              color: Colors.red,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: style,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.grey.shade300,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: style,
            child: Icon(
              Icons.settings,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(
                left: 75,
                child: ShoeColorButton(
                  shoeColor: Color.fromARGB(255, 28, 162, 55),
                  shoeImagePath: 'assets/images/verde.png',
                ),
              ),
              Positioned(
                left: 50,
                child: ShoeColorButton(
                  shoeColor: Color.fromARGB(255, 115, 142, 101),
                  shoeImagePath: 'assets/images/amarillo.png',
                ),
              ),
              Positioned(
                left: 25,
                child: ShoeColorButton(
                  shoeColor: Color(0xff2099F1),
                  shoeImagePath: 'assets/images/azul.png',
                ),
              ),
              Positioned(
                child: ShoeColorButton(
                  shoeColor: Color(0xFF0E2027),
                  shoeImagePath: 'assets/images/negro.png',
                ),
              ),
            ],
          )),
          const RoundedColorButton(
            text: 'More related items',
            horizontalPadding: 15,
            verticalPadding: 5,
            color: Color(0xffFFc675),
          )
        ],
      ),
    );
  }
}
