import 'package:dovi_me/modules/user.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/widgtes/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

bool visiblEye = false;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Themes themes = Themes();
    // print(visiblEye);

    final userController = Get.find<UserAccount>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [lightGreen, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.2])),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: Get.height * .06,
          ),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              backButton(context),
              Text('My Products', style: themes.headline1),
              const SizedBox(height: 50, width: 50)
            ]),
            SizedBox(height: Get.height * .1),
            CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(userController.photoUrl!),
            ),
            Text(
              '@${userController.username!}',
              style: themes.bodyText2,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email',
                    style: themes.subtitleLableText.copyWith(fontSize: 10)),
                SizedBox(
                  width: Get.width * .8,
                  child: TextFormField(
                    initialValue: userController.email,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: grey48,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('password',
                    style: themes.subtitleLableText.copyWith(fontSize: 10)),
                SizedBox(
                  width: Get.width * .8,
                  child: TextFormField(
                    initialValue: userController.pwd,
                    keyboardType: TextInputType.visiblePassword,
                    readOnly: true,
                    obscureText: visiblEye,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: grey48,
                        suffixIcon: visiblEye == true
                            ? IconButton(
                                icon: const Icon(Icons.visibility_off_rounded,
                                    color: blackich),
                                onPressed: () => setState(() {
                                      visiblEye = !visiblEye;
                                    }))
                            : IconButton(
                                icon: const Icon(Icons.visibility,
                                    color: blackich),
                                onPressed: () => setState(() {
                                      visiblEye = !visiblEye;
                                    })),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username',
                    style: themes.subtitleLableText.copyWith(fontSize: 10)),
                SizedBox(
                  width: Get.width * .8,
                  child: TextFormField(
                    initialValue: userController.username,
                    keyboardType: TextInputType.text,
                    readOnly: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: grey48,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () =>
            //change the button to ok insted of save
            Get.back(),
        child: Container(
          height: 60,
          width: Get.width * 0.6,
          decoration: BoxDecoration(
              color: lightGreen, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              'OK',
              style: themes.buttonText,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
