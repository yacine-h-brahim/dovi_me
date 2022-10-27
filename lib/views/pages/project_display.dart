import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/controllers/collections/collections.dart';
import 'package:dovi_me/modules/prduct.dart';
import 'package:dovi_me/modules/project.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/widgtes/add_min.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgtes/back_button.dart';

class ProjectDisplay extends StatefulWidget {
  const ProjectDisplay({this.project, super.key});
  final Map<String, dynamic>? project;
  @override
  State<ProjectDisplay> createState() => _ProjectDisplayState();
}

class _ProjectDisplayState extends State<ProjectDisplay> {
  Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: MediaQuery.of(context).size.height * .06),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            backButton(context),
            Text('Cart', style: themes.headline1),
            const SizedBox(width: 50)
          ]),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: widget.project!['productsItems'].length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              print(widget.project!['productsItems'].toString());
              return FutureBuilder(
                future: productQuantity
                    .where('id',
                        isEqualTo: widget.project!['productsItems'][index])
                    .get(),
                builder: (context, snapshot) {
                  print(snapshot.data.toString());
                  Product product = Product();
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    const CircularProgressIndicator();
                  }
                  products
                      .where('id',
                          isEqualTo:
                              snapshot.data!.docs.first.data()['productId'])
                      .get()
                      .then((value) =>
                          product = Product.fromMap(value.docs.first.data()));

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
                                    image: NetworkImage(product.photoCover!)))),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name!, style: themes.bodyText1),
                            Text(
                              '${product.unitPrice!} Da/${product.unit!}',
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
              );
            },
          )),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: themes.bodyText2),
                  Text('${widget.project!['subTotal']}} Da',
                      style: themes.bodyText2),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discount', style: themes.bodyText2),
                  Text('-${widget.project!['discount']}Da',
                      style: themes.bodyText2.copyWith(color: Colors.red)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price', style: themes.bodyText2),
                  Text('${widget.project!['total']} Da',
                      style: themes.bodyText2.copyWith(color: greenich))
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          InkWell(
              child: Container(
                height: 60,
                width: Get.width * .6,
                decoration: BoxDecoration(
                    color: lightGreen, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'OK',
                    style: themes.buttonText,
                  ),
                ),
              ),
              onTap: null),
          const SizedBox(height: 27),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
