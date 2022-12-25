import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/themes.dart';
import '../widgtes/back_button.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

List<String> units = ['m²', 'platform', 'wall', 'other'];

class _NewProductState extends State<NewProduct> {
  Themes themes = Themes();
  final GlobalKey _keyForm = GlobalKey<FormState>();
  String? _unit = 'other';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              SizedBox(height: Get.height * .06),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                backButton(context),
                Text('New Product', style: themes.headline1),
                InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Add',
                          style: themes.buttonText.copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                    onTap: () {
                      //if a new unit'other was selected' add it to units collection
                    }),
              ]),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .5,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
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
              const SizedBox(height: 15),
              //wrap it under a stream : units.get()
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
                            label:
                                Text('Unit', style: themes.subtitleLableText)),
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
            ],
          ),
        ),
      ),
    );
  }
}
