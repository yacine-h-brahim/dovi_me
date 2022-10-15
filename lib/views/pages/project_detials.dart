import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/cart.dart';
import 'package:dovi_me/views/widgtes/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../widgtes/back_button.dart';

class ProjectDetials extends StatefulWidget {
  const ProjectDetials({super.key});

  @override
  State<ProjectDetials> createState() => _ProjectDetialsState();
}

class _ProjectDetialsState extends State<ProjectDetials> {
  final GlobalKey _keyForm = GlobalKey<FormState>();
  Themes themes = Themes();
  TextEditingController dateTimeControlor = TextEditingController();
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
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: grey48,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)),
                            label: Text('Client name',
                                style: themes.subtitleLableText)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required!!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: TextFormField(
                                keyboardType: TextInputType.none,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.date_range_rounded,
                                        color: greenich,
                                      ),
                                      onPressed: () async {
                                        await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.parse(
                                                    '2010-01-01'),
                                                lastDate: DateTime.parse(
                                                    '2040-12-31'))
                                            .then((value) {
                                          setState(() {
                                            dateTimeControlor.text =
                                                DateFormat.yMd().format(value!);
                                          });
                                        });
                                      },
                                    ),
                                    filled: true,
                                    fillColor: grey48,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    label: Text('Date time',
                                        style: themes.subtitleLableText)),
                                readOnly: true,
                                controller: dateTimeControlor,
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  suffixText: 'Da',
                                  suffixStyle: themes.subtitleLableText
                                      .copyWith(color: greenich),
                                  // Text(
                                  //   ,
                                  //   style:
                                  // ),
                                  filled: true,
                                  fillColor: grey48,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(12)),
                                  label: Text('Discount',
                                      style: themes.subtitleLableText)),
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
              width: MediaQuery.of(context).size.width * .6,
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Cart()));
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
