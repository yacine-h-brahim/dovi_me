import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/controllers/collections/collections.dart';
import 'package:dovi_me/modules/prduct.dart';
import 'package:dovi_me/modules/products_list.dart';
import 'package:dovi_me/modules/project.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/widgtes/add_min.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgtes/back_button.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  // final List<Product>? products;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Themes themes = Themes();
  final projectController = Get.find<Project>();
  final productsList = Get.find<PrdList>();

  ///methods////

  @override
  Widget build(BuildContext context) {
    // num? subtotal =
    //     projectController.subTotal != null ? projectController.subTotal : 0;
    // num? total = projectController.total != null ? projectController.total : 0;
    // num? discount =
    //     projectController.discount != null ? projectController.discount : 0;
    // for (var i = 0; i < projectController.products!.length; i++) {
    //   subtotal = subtotal! +
    //       (projectController.products![i]!.unitPrice! *
    //           projectController.products![i]!.quantity!);
    // }
    // total = subtotal! - discount!;

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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset('images/hand_swipe.svg', height: 20),
            const SizedBox(width: 5),
            Text('swipe on an item to delete',
                style: themes.subtitleLableText
                    .copyWith(fontSize: 10, color: blackich))
          ]),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: productsList.productsList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              int quantity = productsList.productsList[index]!.quantity!;

              return Visibility(
                visible: productsList.productsList[index]!.quantity != 0,
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  background:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12545),
                          color: const Color.fromRGBO(237, 0, 0, 0.58),
                        ),
                        child: const Icon(Icons.close, color: Colors.white)),
                    const SizedBox(width: 21)
                  ]),
                  onDismissed: (direction) {
                    setState(() {
                      productsList.productsList.removeAt(index);
                      //REMOVE ITEM FROM THE LIST
                    });
                  },
                  child: Container(
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
                              '${productsList.productsList[index]!.unitPrice!} Da/${productsList.productsList[index]!.unit!}',
                              style: themes.bodyText2
                                  .copyWith(fontSize: 13, color: greenich),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Quantity(index: index)
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: themes.bodyText2),
              Text('${projectController.subTotal} Da', style: themes.bodyText2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount', style: themes.bodyText2),
              Text('-${projectController.discount}Da',
                  style: themes.bodyText2.copyWith(color: Colors.red)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price', style: themes.bodyText2),
              Text('${projectController.total} Da',
                  style: themes.bodyText2.copyWith(color: greenich))
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
                    'Save',
                    style: themes.buttonText,
                  ),
                ),
              ),
              onTap: () {
                // Get.to(const Cart());
                //creating array list of productsquantity
                // final List<String?> productsQuantityList = [];
                // for (Product? element in projectController.products!) {
                //   final doc = productQuantity.doc();
                //   doc.set({
                //     'id': doc.id,
                //     'productId': element!.id,
                //     'projectId': element.id,
                //     'quantity': element.quantity,
                //   });
                //   productsQuantityList.add(doc.id);
                // }
                // // save data into firestore//

                // projects.doc(projectController.id).set({});
              }),
          const SizedBox(height: 27),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
