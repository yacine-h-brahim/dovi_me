import 'package:dovi_me/modules/prduct.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgtes/back_button.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({required this.product, super.key});
  final Product product;

  @override
  State<EditProduct> createState() => _EditProductState();
}

List<String> units = ['m²', 'platform', 'wall', 'other'];

class _EditProductState extends State<EditProduct> {
  String? _unit = 'other';

  final GlobalKey _keyForm = GlobalKey<FormState>();
  Themes themes = Themes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _keyForm,
          child: Column(children: [
            SizedBox(height: Get.height * .06),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              backButton(context),
              Text('Edit Product', style: themes.headline1),
              InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'save',
                        style: themes.buttonText.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                  onTap: () {}),
            ]),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * .5,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: widget.product.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: grey48,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        label: Text('Name', style: themes.subtitleLableText)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required!!';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: TextFormField(
                      initialValue: widget.product.unitPrice.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffixText: 'Da',
                          suffixStyle: themes.subtitleLableText
                              .copyWith(color: blackich),
                          filled: true,
                          fillColor: grey48,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)),
                          label:
                              Text('Price', style: themes.subtitleLableText)),
                    )),
              ],
            ),
            //space here
            const SizedBox(height: 15),
            SizedBox(
              height: Get.height * .3,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                // scrollDirection: Axis.horizontal,
                itemCount: units.length,
                itemBuilder: (context, index) => RadioListTile(
                  groupValue: _unit,
                  title: Text(units[index]),
                  value: units[index],
                  onChanged: (String? value) {
                    setState(() {
                      _unit = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 5),
            _unit == 'other'
                ? SizedBox(
                    width: Get.width * .99,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: grey48,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)),
                          label: Text('Unit', style: themes.subtitleLableText)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'this field is required!!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  )
                : Container(),
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
            Align(
              child: InkWell(
                onTap: () {
                  //pick a new image from glarry for the product
                },
                child: Container(
                  height: Get.height * .2,
                  width: Get.width * .8,
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
            ),
          ]),
        ),
      ),
    );
  }
}
