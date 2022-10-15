import 'package:dovi_me/views/pages/my_product.dart';
import 'package:dovi_me/views/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../style/themes.dart';

Widget drawerWidget(BuildContext context) {
  Themes themes = Themes();

  return Container(
    decoration: const BoxDecoration(
        color: lightGreen,
        gradient: LinearGradient(colors: [
          Color.fromRGBO(221, 244, 214, 1),
          Color.fromRGBO(163, 254, 165, 1)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width * .75,
    child: Column(children: [
      DrawerHeader(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('images/tomHeddlaston.jpg')),
        const SizedBox(width: 16),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Yacine Hadj Brahim', style: themes.headline2),
          Text('y.hadjbrahim@esi-sba.dz', style: themes.subtitleLableText)
        ])
      ])),
      ListTile(
          leading:
              const Icon(Icons.business_rounded, color: blackich, size: 25),
          title: Text('All Projects',
              style: themes.buttonText.copyWith(fontSize: 17)),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () {
            Navigator.pop(context);
          }),
      ListTile(
          leading: SvgPicture.asset('images/product_page_icon.svg',
              color: blackich, height: 25, width: 25),
          title: Text('All Products',
              style: themes.buttonText.copyWith(fontSize: 17)),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyProducts()));
          }),
      ListTile(
          leading: SvgPicture.asset('images/profile.svg'),
          title:
              Text('Profile', style: themes.buttonText.copyWith(fontSize: 17)),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile()));
          }),
      Expanded(child: Container()),
      Row(
        children: [
          Expanded(child: Container()),
          InkWell(
              child: Row(children: [
            Text(
              'Log Out',
              style: themes.buttonText.copyWith(fontSize: 17),
            ),
            const Icon(Icons.logout_outlined)
          ])),
        ],
      )
    ]),
  );
}
