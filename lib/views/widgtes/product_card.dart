import 'package:dovi_me/style/themes.dart';
import 'package:flutter/material.dart';

Widget buildProductCard({required int listLingth, required int index}) {
  Themes themes = Themes();
  return Container(
    padding: const EdgeInsets.all(16),
    margin: (listLingth == index)
        ? const EdgeInsets.only(bottom: 60)
        : const EdgeInsets.only(bottom: 12),
    decoration:
        BoxDecoration(color: grey48, borderRadius: BorderRadius.circular(12)),
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
                    image: AssetImage('images/tomHeddlaston.jpg')))),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Platform', style: themes.bodyText1),
            Text(
              '1000000 Da/m²',
              style: themes.bodyText2.copyWith(fontSize: 13, color: greenich),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                    color: lightGreen, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: InkWell(
                      child: Text('-',
                          style: themes.bodyText2.copyWith(fontSize: 20)),
                      onTap: () {}),
                )),
            const SizedBox(width: 8),
            Text('0', style: themes.headline2),
            const SizedBox(width: 8),
            Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                    color: lightGreen, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: InkWell(
                      child: Text('+',
                          style: themes.bodyText2.copyWith(fontSize: 20)),
                      onTap: () {}),
                ))
          ],
        )
      ],
    ),
  );
}
