import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import 'components/add_item_button.dart';
import 'components/cover_image.dart';
import 'components/input_field.dart';
import 'components/instruction_image.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({Key? key}) : super(key: key);

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  int nutritionItemCount = 1;
  int ingredientItemCount = 1;
  int instructionItemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Iconsax.close_circle,
          ),
        ),
        title: const Text('Create Recipe'),
        actions: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20)),
              backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text('Save'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20)),
              foregroundColor: const MaterialStatePropertyAll(kPrimaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: const BorderSide(color: kPrimaryColor, width: 2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Text('Publish'),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Iconsax.more),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CoverImage(),
                const AbyInputField(label: 'Name', hintText: 'Enter food name'),
                const AbyInputField(
                    label: 'Description', hintText: 'Enter food description'),
                // ------------------------DIVIDER-------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child:
                      Divider(thickness: 1, color: kDarkColor.withOpacity(0.2)),
                ),
                Text(
                  'Nutrition',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ListView.builder(
                  itemCount: nutritionItemCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const AbyInputFieldSecond(hintText: 'Nutrition'),
                        const AbyInputFieldSecond(hintText: 'Unit'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              nutritionItemCount--;
                            });
                          },
                          icon: const Icon(Iconsax.trash, color: kErrorColor),
                        ),
                      ],
                    );
                  },
                ),
                AddItemButton(
                  text: 'Add Nutritonal',
                  onPressed: () {
                    setState(() {
                      nutritionItemCount++;
                    });
                  },
                ),
                // ------------------------DIVIDER-------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child:
                      Divider(thickness: 1, color: kDarkColor.withOpacity(0.2)),
                ),
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ListView.builder(
                  itemCount: ingredientItemCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            '${index + 1}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const AbyInputFieldThird(hintText: 'Ingredient'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              ingredientItemCount--;
                            });
                          },
                          icon: const Icon(Iconsax.trash, color: kErrorColor),
                        ),
                      ],
                    );
                  },
                ),
                AddItemButton(
                  text: 'Add Ingredient',
                  onPressed: () {
                    setState(() {
                      ingredientItemCount++;
                    });
                  },
                ),
                // ------------------------DIVIDER-------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child:
                      Divider(thickness: 1, color: kDarkColor.withOpacity(0.2)),
                ),
                Text(
                  'Instructions',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                ListView.builder(
                  itemCount: instructionItemCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                '${index + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  const AbyInputFieldFourth(),
                                  SizedBox(
                                    height: 80,
                                    child: ListView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return const InstructionImage();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  instructionItemCount--;
                                });
                              },
                              icon: const Icon(
                                Iconsax.trash,
                                color: kErrorColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                AddItemButton(
                  text: 'Add Instruction',
                  onPressed: () {
                    setState(() {
                      instructionItemCount++;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
