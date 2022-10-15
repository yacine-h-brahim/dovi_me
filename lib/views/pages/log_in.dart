import 'package:dovi_me/style/custom_paint.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Themes themes = Themes();
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool visiblEye = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
                height: MediaQuery.of(context).size.height * .35,
                color: lightGreen),
          ),
          Text(
            'Login',
            style: themes.headline0,
          ),
          const SizedBox(height: 50),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: grey48,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        label: Text('Email', style: themes.subtitleLableText)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required!!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: visiblEye,
                    decoration: InputDecoration(
                        suffixIcon: visiblEye
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
                        filled: true,
                        fillColor: grey48,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        label:
                            Text('Password', style: themes.subtitleLableText)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required!!';
                      } else {
                        return null;
                      }
                    },
                  )
                ],
              )),
          InkWell(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                    color: blackich, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    'LOG IN',
                    style: themes.bodyText2.copyWith(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MyHomePage()));
              }),
          const SizedBox(height: 30),
          Row(children: const [
            Expanded(
              child: Divider(
                height: 40,
                endIndent: 10,
                color: blackich,
              ),
            ),
            Text('Or'),
            Expanded(
              child: Divider(
                indent: 10,
                height: 40,
                color: blackich,
              ),
            )
          ]),
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 30,
            backgroundColor: lighBlue,
            child: SvgPicture.asset(
              'images/flat-color-icons_google.svg',
            ),
          ),
          const SizedBox(height: 8),
          RichText(
              text: TextSpan(text: '', children: [
            TextSpan(
                text: 'Don\'t have account? ', style: themes.subtitleLableText),
            TextSpan(text: 'Create now', style: themes.bodyText2)
          ]))
        ]),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, h);
    // Offset point1 = Offset(10, size.height - 10);
    Offset thePick1 = Offset(w * .15, size.height - (size.height * .65));
    Offset thePick = Offset(size.width * .5, size.height - (size.height * .8));
    Offset thePick2 =
        Offset(size.width * .85, size.height - (size.height * .65));
    // Offset point2 = Offset(size.width - 10, size.height - 10);
    path.quadraticBezierTo(thePick1.dx, thePick1.dy, thePick2.dx, thePick2.dy);
    // path.quadraticBezierTo(thePick.dx, thePick.dy, thePick2.dx, thePick2.dy);
    path.quadraticBezierTo(thePick2.dx, thePick2.dy, size.width, 0);
    path.quadraticBezierTo(thePick2.dx, thePick2.dy, size.width, 0);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
