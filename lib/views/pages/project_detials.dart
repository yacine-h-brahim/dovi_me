import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/controllers/collections/collections.dart';
import 'package:dovi_me/modules/prduct.dart';
import 'package:dovi_me/modules/products_list.dart';
import 'package:dovi_me/modules/project.dart';
import 'package:dovi_me/modules/user.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/cart.dart';
import 'package:dovi_me/views/widgtes/add_min.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../widgtes/back_button.dart';

class ProjectDetials extends StatefulWidget {
  const ProjectDetials({super.key});

  @override
  State<ProjectDetials> createState() => _ProjectDetialsState();
}

class _ProjectDetialsState extends State<ProjectDetials> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  Themes themes = Themes();
  String? customerName;
  num? discount = 0;

  TextEditingController startDateTimeControlor = TextEditingController();
  TextEditingController endDateTimeControlor = TextEditingController();

  final userAccount = Get.find<UserAccount>();
  final projectController = Get.put(Project());

//Methods//

  // Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
  //   // var productsCollection = ;
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    PrdList productsList = Get.put(PrdList());

//TODO: fill productsList from products collection
    products.get().then((value) {
      value.docs.forEach((element) {
        !productsList.productsList.contains(element)
            ? productsList.productsList.add(Product.fromMap(element.data()))
            : null;
      });
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: Get.height * .06),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                backButton(context),
                Text('Project Detials', style: themes.headline1),
                InkWell(
                    onTap: () {},
                    child:
                        SvgPicture.asset('images/Vector.svg', color: blackich))
              ]),
              Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Client name',
                                  style: themes.subtitleLableText
                                      .copyWith(fontSize: 10)),
                              SizedBox(
                                width: Get.width * .55,
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: grey48,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: blackich,
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: greenich,
                                    )),
                                  ),
                                  onChanged: (value) => customerName = value,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'this field is required!!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Discount',
                                  style: themes.subtitleLableText
                                      .copyWith(fontSize: 10)),
                              SizedBox(
                                width: Get.width * .35,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixText: 'Da',
                                    suffixStyle: themes.subtitleLableText
                                        .copyWith(color: greenich),
                                    filled: true,
                                    fillColor: grey48,
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: blackich,
                                    )),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: greenich,
                                    )),
                                  ),
                                  onChanged: (value) =>
                                      discount = num.tryParse(value),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'this field is required!!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Start Date time ',
                                  style: themes.subtitleLableText
                                      .copyWith(fontSize: 10)),
                              SizedBox(
                                width: Get.width * .45,
                                child: TextFormField(
                                  onTap: () async {
                                    await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate:
                                                DateTime.parse('2010-01-01'),
                                            lastDate:
                                                DateTime.parse('2040-12-31'))
                                        .then((value) {
                                      startDateTimeControlor.text =
                                          value != null
                                              ? DateFormat.yMd().format(value)
                                              : '';
                                    });
                                  },
                                  keyboardType: TextInputType.none,
                                  decoration: const InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.date_range_rounded,
                                          color: greenich,
                                        ),
                                        onPressed: null),
                                    filled: true,
                                    fillColor: grey48,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: blackich,
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: greenich,
                                    )),
                                  ),
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'this field is required!!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: startDateTimeControlor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('End Date time',
                                  style: themes.subtitleLableText
                                      .copyWith(fontSize: 10)),
                              SizedBox(
                                width: Get.width * .45,
                                child: TextFormField(
                                  onTap: () async {
                                    await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate:
                                                DateTime.parse('2010-01-01'),
                                            lastDate:
                                                DateTime.parse('2040-12-31'))
                                        .then((value) {
                                      endDateTimeControlor.text = value != null
                                          ? DateFormat('yMd').format(value)
                                          : '';
                                    });
                                  },
                                  keyboardType: TextInputType.none,
                                  decoration: const InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.date_range_rounded,
                                          color: greenich,
                                        ),
                                        onPressed: null),
                                    filled: true,
                                    fillColor: grey48,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: blackich,
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: greenich,
                                    )),
                                  ),
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'this field is required!!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: endDateTimeControlor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 8),
              Text('Products', style: themes.subtitleLableText),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 50),
                itemCount: productsList.productsList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: grey48, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: lightGreen,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(productsList
                                        .productsList[index]!.photoCover!)))),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productsList.productsList[index]!.name!,
                                style: themes.bodyText1),
                            Text(
                              '${productsList.productsList[index]!.unitPrice} Da/${productsList.productsList[index]!.unit}',
                              style: themes.bodyText2
                                  .copyWith(fontSize: 13, color: greenich),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Quantity(index: index)
                      ],
                    ),
                  );
                },
              )),
            ])),
        floatingActionButton: InkWell(
            child: Container(
              height: 60,
              width: Get.width * .6,
              decoration: BoxDecoration(
                  color: lightGreen, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  'Done',
                  style: themes.buttonText,
                ),
              ),
            ),
            onTap: () {
              if (_keyForm.currentState!.validate()) {
                //date contrainte

                projectController.id = projects.doc().id;
                projectController.customerName = customerName;
                projectController.dateTime = startDateTimeControlor.text;
                projectController.dateTimeEnd = endDateTimeControlor.text;
                projectController.discount = discount;
                projectController.ownerId = userAccount.id;
                Get.to(const Cart());
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
