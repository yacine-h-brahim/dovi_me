import 'package:dovi_me/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TryPage extends StatefulWidget {
  const TryPage({super.key});

  @override
  State<TryPage> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  String? _unit;
  @override
  Widget build(BuildContext context) {
    List<String> units = ['m_2', 'platform', 'wall', 'other'];
    bool otherSelected = false;
    Themes themes = Themes();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * .3,
            child: ListView.builder(
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
                  //challanges
                },
              ),
            ),
          ),
          _unit == 'other'
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
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
              : Container()
        ],
      ),
    );
  }
}
