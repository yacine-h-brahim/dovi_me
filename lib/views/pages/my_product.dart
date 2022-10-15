import 'package:dovi_me/views/pages/new_product.dart';
import 'package:dovi_me/views/widgtes/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/themes.dart';
import '../widgtes/back_button.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  Themes themes = Themes();
  List<String> items = ['', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .06),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                backButton(context),
                Text('My Products', style: themes.headline1),
                plusButton(context, const NewProduct())
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  'images/hand_swipe.svg',
                  height: 20,
                ),
                const SizedBox(width: 5),
                Text('swipe on an item to delete',
                    style: themes.subtitleLableText
                        .copyWith(fontSize: 10, color: blackich))
              ]),
              Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: items.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(),
                    background: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12545),
                                color: const Color.fromRGBO(237, 0, 0, 0.58),
                              ),
                              child:
                                  const Icon(Icons.close, color: Colors.white)),
                          const SizedBox(width: 21)
                        ]),
                    onDismissed: (direction) {
                      setState(() {
                        items.removeAt(index);
                        //REMOVE ITEM FROM THE LIST
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                          color: grey48,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: lightGreen,
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'images/tomHeddlaston.jpg')))),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Platform', style: themes.bodyText1),
                              Text(
                                '1000000 Da/m²',
                                style: themes.bodyText2
                                    .copyWith(fontSize: 13, color: greenich),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  color: lightGreen,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: InkWell(
                                    child: const Icon(Icons.edit),
                                    onTap: () {}),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ))
            ],
          )),
    );
  }
}
