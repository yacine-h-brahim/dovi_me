import 'package:dovi_me/controllers/authentication.dart';
import 'package:dovi_me/modules/user.dart';
import 'package:dovi_me/views/pages/log_in.dart';
import 'package:dovi_me/views/pages/my_product.dart';
import 'package:dovi_me/views/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../style/themes.dart';

Widget drawerWidget(BuildContext context) {
  final userController = Get.find<UserAccount>();

  Themes themes = Themes();

  return Container(
    decoration: const BoxDecoration(
        color: lightGreen,
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(221, 244, 214, 1),
              Color.fromARGB(208, 175, 234, 176)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.8, 0.99])),
    height: Get.height,
    width: Get.width * .8,
    child: Column(children: [
      DrawerHeader(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(userController.photoUrl!)),
        const SizedBox(width: 8),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('@${userController.username!}', style: themes.headline2),
              Text(userController.email!, style: themes.subtitleLableText)
            ])
      ])),
      ListTile(
          leading:
              const Icon(Icons.business_rounded, color: blackich, size: 25),
          title: Text('All Projects',
              style: themes.buttonText.copyWith(fontSize: 17)),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () => Get.back()),
      ListTile(
          leading: SvgPicture.asset('images/product_page_icon.svg',
              color: blackich, height: 25, width: 25),
          title: Text('All Products',
              style: themes.buttonText.copyWith(fontSize: 17)),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () => Get.to(const MyProducts())),
      ListTile(
          leading: SvgPicture.asset('images/profile.svg'),
          title:
              Text('Profile', style: themes.buttonText.copyWith(fontSize: 17)),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap: () => Get.to(const Profile())),
      Expanded(child: Container()),
      Row(
        children: [
          Expanded(child: Container()),
          InkWell(
              onTap: () {
                //log out

                AuthService().logOut();
                Get.off(const LogIn());
              },
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
