import 'package:aby_eatery/Models/item.dart';
import 'package:flutter/material.dart';

import 'buy_button.dart';

class PriceAndBuy extends StatelessWidget {
  const PriceAndBuy({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: '\$ ',
                        style: TextStyle(color: Colors.red, fontSize: 22)),
                    TextSpan(
                        text: item.price.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 22))
                  ]),
                )
              ],
            )),
        const Spacer(),
        Expanded(flex: 4, child: BuyButton(tap: () {})),
      ],
    );
  }
}
