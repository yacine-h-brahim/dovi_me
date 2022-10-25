import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/cart.dart';
import 'package:dovi_me/views/widgtes/product_card.dart';
import 'package:firebase_core/firebase_core.dart';
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
  num? discount;

  TextEditingController startDateTimeControlor = TextEditingController();
  TextEditingController endDateTimeControlor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: MediaQuery.of(context).size.height * .06),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
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
                                      discount = value as num?,
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
                                      setState(() {
                                        startDateTimeControlor.text =
                                            DateFormat.yMd().format(value!);
                                      });
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
                                      setState(() {
                                        endDateTimeControlor.text =
                                            DateFormat('yMd').format(value!);
                                      });
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
                padding: const EdgeInsets.all(0),
                itemCount: 7,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  //TODO: CHANGE THE LIST LINGTH TO DYNAMIC
                  return buildProductCard(listLingth: 6, index: index);
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
                Get.to(const Cart());
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
