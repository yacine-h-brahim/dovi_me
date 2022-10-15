import 'package:flutter/material.dart';

import '../../style/themes.dart';
import '../widgtes/back_button.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  Themes themes = Themes();
  final GlobalKey _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .06),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              backButton(context),
              Text('Product Detials', style: themes.headline1),
              const SizedBox(width: 50),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView(
                children: [
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
                                label: Text('Name',
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
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        suffixText: 'Da',
                                        suffixStyle: themes.subtitleLableText
                                            .copyWith(color: blackich),
                                        filled: true,
                                        fillColor: grey48,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        label: Text('Price',
                                            style: themes.subtitleLableText)),
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: grey48,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      label: Text('Unit',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Image',
                          style: themes.subtitleLableText,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: MediaQuery.of(context).size.width * .85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: lightGreen,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.file_download_outlined, size: 65),
                          Text('import image', style: themes.bodyText2)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .6,
                  decoration: BoxDecoration(
                      color: lightGreen,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Save',
                      style: themes.buttonText,
                    ),
                  ),
                ),
                onTap: () {}),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
