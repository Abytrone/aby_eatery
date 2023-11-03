import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import '../../controllers/products_controller.dart';
import 'components/add_item_button.dart';
import 'components/cover_image.dart';
import 'components/input_field.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({Key? key}) : super(key: key);

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final ProductsController productsController = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  // final TextEditingController category = TextEditingController();
  final TextEditingController description = TextEditingController();

  final List<TextEditingController> nutritionController = [];
  final List<String> nutritions = [];
  final List<TextEditingController> nutritionUnitController = [];
  final List<String> nutritionsUnit = [];

  final List<TextEditingController> ingredientController = [];
  final List<String> ingredient = [];
  final List<TextEditingController> instructionController = [];
  final List<String> instruction = [];

  List<String> nutritionFields = ['value0'];
  List<String> ingredientFields = ['value0'];
  List<String> instructionFields = ['value0'];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < instructionFields.length; i++) {
      instructionController.add(TextEditingController());
    }

    for (var i = 0; i < ingredientFields.length; i++) {
      ingredientController.add(TextEditingController());
    }

    for (int i = 0; i < nutritionFields.length; i++) {
      nutritionController.add(TextEditingController());
      nutritionUnitController.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Obx(
        () => Scaffold(
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final List<String> nutri = [];
                    for (var i = 0; i < nutritions.length; i++) {
                      final nut = [
                        nutritions[i],
                        nutritionsUnit[i],
                      ];
                      nutri.add('"$nut"');
                    }
                    // print(nutri);
                    productsController.createProduct(
                      name: name.text,
                      description: description.text,
                      nutrition: nutri,
                      ingredients: ingredient,
                      instructions: instruction,
                      status: 0,
                      // categoryId: category.text,
                      createdAt: DateTime.now().toString(),
                    );
                  }
                },
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20)),
                  backgroundColor:
                      const MaterialStatePropertyAll(kPrimaryColor),
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final List<String> nutri = [];
                    for (var i = 0; i < nutritions.length; i++) {
                      final nut = [
                        nutritions[i],
                        nutritionsUnit[i],
                      ];
                      nutri.add(nut.toString());
                    }
                    productsController.createProduct(
                      name: name.text,
                      description: description.text,
                      nutrition: nutri,
                      ingredients: ingredient,
                      instructions: instruction,
                      status: 1,
                      // categoryId: category.text,
                      createdAt: DateTime.now().toString(),
                    );
                  }
                },
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20)),
                  foregroundColor:
                      const MaterialStatePropertyAll(kPrimaryColor),
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
              // IconButton(
              //   icon: const Icon(Iconsax.more),
              //   onPressed: () {},
              // ),
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
                    Visibility(
                      visible: productsController.isFilePicked.value == false,
                      child: CoverImage(
                        onTap: () {
                          productsController.pickImages();
                        },
                      ),
                    ),
                    Visibility(
                      visible: productsController.isFilePicked.value == true,
                      child: SizedBox(
                        height: 350,
                        child: ListView.builder(
                            itemCount: productsController.images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CoverImageSelected(
                                file: productsController.images[index],
                                onTap: () {
                                  productsController.pickImages();
                                },
                              );
                            }),
                      ),
                    ),
                    AbyInputField(
                      controller: name,
                      label: 'Name',
                      hintText: 'Enter food name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Required';
                        }
                        return null;
                      },
                    ),
                    // AbyInputField(
                    //   controller: category,
                    //   label: 'Category',
                    //   hintText: 'Enter food category',
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return '* Required';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    AbyInputField(
                      controller: description,
                      label: 'Description',
                      hintText: 'Enter food description',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Required';
                        }
                        return null;
                      },
                    ),
                    // ------------------------DIVIDER-------------------------
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    Text(
                      'Nutrition',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    ListView.builder(
                      itemCount: nutritionFields.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            AbyInputFieldSecond(
                              hintText: 'Nutrition',
                              controller: nutritionController[index],
                              validator: (value) {
                                setState(() {
                                  nutritions.add(value!);
                                });
                                if (value!.isEmpty) {
                                  return '* Required';
                                }
                                return null;
                              },
                            ),
                            AbyInputFieldSecond(
                              hintText: 'Unit',
                              controller: nutritionUnitController[index],
                              validator: (value) {
                                setState(() {
                                  nutritionsUnit.add(value!);
                                });
                                if (value!.isEmpty) {
                                  return '* Required';
                                }
                                return null;
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  nutritionFields.removeAt(index);
                                  nutritionController.removeAt(index);
                                  nutritionUnitController.removeAt(index);
                                });
                              },
                              icon:
                                  const Icon(Iconsax.trash, color: kErrorColor),
                            ),
                          ],
                        );
                      },
                    ),
                    AddItemButton(
                      text: 'Add Nutriton',
                      onPressed: () {
                        setState(() {
                          nutritionFields.add('value1');
                          nutritionController.add(TextEditingController());
                          nutritionUnitController.add(TextEditingController());
                        });
                      },
                    ),
                    // ------------------------DIVIDER-------------------------
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    Text(
                      'Ingredients',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    ListView.builder(
                      itemCount: ingredientFields.length,
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
                            AbyInputFieldThird(
                              hintText: 'Ingredient',
                              controller: ingredientController[index],
                              validator: (value) {
                                setState(() {
                                  ingredient.add(value!);
                                });
                                if (value!.isEmpty) {
                                  return '* Required';
                                }
                                return null;
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  ingredientFields.removeAt(index);
                                  ingredientController.removeAt(index);
                                });
                              },
                              icon:
                                  const Icon(Iconsax.trash, color: kErrorColor),
                            ),
                          ],
                        );
                      },
                    ),
                    AddItemButton(
                      text: 'Add Ingredient',
                      onPressed: () {
                        setState(() {
                          ingredientFields.add('value');
                          ingredientController.add(TextEditingController());
                        });
                      },
                    ),
                    // ------------------------DIVIDER-------------------------
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    Text(
                      'Instructions',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    ListView.builder(
                      itemCount: instructionFields.length,
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
                                      AbyInputFieldFourth(
                                        controller:
                                            instructionController[index],
                                        validator: (value) {
                                          setState(() {
                                            instruction.add(value!);
                                          });
                                          if (value!.isEmpty) {
                                            return '* Required';
                                          }
                                          return null;
                                        },
                                      ),
                                      // SizedBox(
                                      //   height: 80,
                                      //   child: ListView.builder(
                                      //     itemCount: 3,
                                      //     shrinkWrap: true,
                                      //     scrollDirection: Axis.horizontal,
                                      //     itemBuilder: (context, index) {
                                      //       return const InstructionImage();
                                      //     },
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      instructionFields.removeAt(index);
                                      instructionController.removeAt(index);
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
                          instructionFields.add('value');
                          instructionController.add(TextEditingController());
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
