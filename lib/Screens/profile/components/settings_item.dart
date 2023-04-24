import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    this.onTap,
  });

  final String icon;
  final String text;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(icon),
                ),
                const SizedBox(width: 30),
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 17,
                      ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Iconsax.arrow_right_3),
              ],
            )
          ],
        ),
      ),
    );
  }
}
