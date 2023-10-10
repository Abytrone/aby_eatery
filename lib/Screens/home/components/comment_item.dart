import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../services/constants.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    Key? key,
    required this.comment,
    required this.user,
  }) : super(key: key);
  final Document comment;
  final Document user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/images/placeholder_landscape.png',
                          image:
                              'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${user.data['image']}/view?project=$projectId',
                          // ignore: invalid_use_of_protected_member
                          // 'http://$endPoint/storage/buckets/$profilePicturesBucket/files/${userController.user.value['image']}/view?project=$projectId',
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      user.data['name'],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.more),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                comment.data['comment'],
                textAlign: TextAlign.left,
                // 'Loving this recipe! So many delicious recipes to choose from ♥♥♥',
              ),
            ),
            Row(
              children: [
                // const Icon(
                //   Iconsax.heart,
                // ),
                // const SizedBox(width: 10),
                // Text(
                //   '356',
                //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //         color: kDarkColor.withOpacity(0.7),
                //       ),
                // ),
                // const SizedBox(width: 30),
                TimeAgoWidget(targetTimeString: comment.$createdAt),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TimeAgoWidget extends StatelessWidget {
  const TimeAgoWidget({super.key, required this.targetTimeString});
  final String targetTimeString;

  String formatTimeAgo() {
    final targetTime =
        DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUtc(targetTimeString);
    final now = DateTime.now().toUtc();
    final difference = now.difference(targetTime);

    if (difference.inSeconds < 60) {
      return '${getQuantityString(difference.inSeconds, 'second', 'seconds')} ago';
    } else if (difference.inMinutes < 60) {
      return '${getQuantityString(difference.inMinutes, 'minute', 'minutes')} ago';
    } else if (difference.inHours < 24) {
      return '${getQuantityString(difference.inHours, 'hour', 'hours')} ago';
    } else if (difference.inDays < 7) {
      return '${getQuantityString(difference.inDays, 'day', 'days')} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${getQuantityString(weeks, 'week', 'weeks')} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${getQuantityString(months, 'month', 'months')} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${getQuantityString(years, 'year', 'years')} ago';
    }
  }

  String getQuantityString(int count, String singular, String plural) {
    if (count == 1) {
      return '$count $singular';
    } else {
      return '$count $plural';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTimeAgo(),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: kDarkColor.withOpacity(0.7),
          ),
    );
  }
}
