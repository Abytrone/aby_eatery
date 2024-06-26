import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.username,
    required this.title,
    required this.userImage,
    required this.productImage,
  }) : super(key: key);
  final String username;
  final String title;
  final String userImage;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    // final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 250,
        width: 180,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Positioned.fill(
              child: SizedBox(
                height: 250,
                width: 180,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder_potrait.png',
                    image: productImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.1, 1.0],
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 15),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       height: 20,
                  //       width: 20,
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(20),
                  //         child: userController.user.value.value!.prefs
                  //                     .data['profilePicture'] ==
                  //                 ' '
                  //             ? Image.asset(
                  //                 'assets/images/placeholder_landscape.png',
                  //                 fit: BoxFit.cover,
                  //               )
                  //             : FadeInImage.assetNetwork(
                  //                 placeholder:
                  //                     'assets/images/placeholder_landscape.png',
                  //                 image:
                  //                     'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${userController.user.value.value!.prefs.data['profilePicture']}/view?project=$projectId',
                  //                 fit: BoxFit.cover,
                  //               ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Text(
                  //       username,
                  //       style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //             color: Colors.white,
                  //           ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // Positioned(
            //   top: 5,
            //   right: 5,
            //   child: IconButton(
            //     icon: SvgPicture.asset(
            //       'assets/icons/heart.svg',
            //       colorFilter: const ColorFilter.mode(
            //         Colors.white,
            //         BlendMode.srcIn,
            //       ),
            //     ),
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            //     ),
            //     onPressed: () {},
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
