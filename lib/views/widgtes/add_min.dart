import 'package:dovi_me/modules/project.dart';
import 'package:dovi_me/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Quantity extends StatefulWidget {
  Quantity({required this.index, super.key});
  int? index;
  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  @override
  Widget build(BuildContext context) {
    Themes themes = Themes();
    final projectController = Get.find<Project>();
    int quantity = projectController.products![widget.index!]!.quantity!;
    return Row(
      children: [
        Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
                color: lightGreen, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: InkWell(
                  child:
                      Text('-', style: themes.bodyText2.copyWith(fontSize: 20)),
                  onTap: () {
                    setState(() {
                      quantity <= 0 ? 0 : quantity--;
                    });
                    projectController.products![widget.index!]!.quantity =
                        quantity;
                  }),
            )),
        const SizedBox(width: 8),
        Text(projectController.products![widget.index!]!.quantity.toString(),
            style: themes.headline2),
        const SizedBox(width: 8),
        Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
                color: lightGreen, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: InkWell(
                  child:
                      Text('+', style: themes.bodyText2.copyWith(fontSize: 20)),
                  onTap: () {
                    setState(() {
                      quantity < 0 ? 0 : quantity++;
                    });
                    projectController.products![widget.index!]!.quantity =
                        quantity;
                  }),
            ))
      ],
    );
  }
}
