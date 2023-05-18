import 'package:flutter/material.dart';

import '../../../constants.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem({
    Key? key,
    required this.number,
    required this.text,
    // required this.images,
  }) : super(key: key);
  final String number;
  final String text;
  // final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              number,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: Text(
                    text,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                  ),
                ),
                // const SizedBox(height: 10),
                // SizedBox(
                //   height: 80,
                //   child: ListView.builder(
                //     itemCount: images.length,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.only(right: 8.0),
                //         child: Container(
                //           width: 110,
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage(images[index]),
                //               fit: BoxFit.cover,
                //             ),
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
