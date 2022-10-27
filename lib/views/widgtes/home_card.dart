import 'package:dovi_me/style/themes.dart';
import 'package:dovi_me/views/pages/cart.dart';
import 'package:dovi_me/views/pages/project_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Widget card(
    {required int index,
    required Map<String, dynamic> project,
    required BuildContext context}) {
  const List<List<Color>> gradientColors = [
    [blueDark1, blueDark2],
    [pink1, pink2],
    [blue1, blue2],
    [green1, green2]
  ];

  int i = index % gradientColors.length;
  Themes themes = Themes();
  return InkWell(
    child: Container(
        margin: const EdgeInsets.only(right: 14, left: 14, bottom: 16),
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [
              gradientColors.elementAt(i)[0],
              gradientColors.elementAt(i)[1]
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Stack(
          children: [
            Positioned(
                bottom: 10,
                child: SvgPicture.asset(
                  'images/addSvgs.svg',
                  color: Colors.white.withOpacity(.2),
                  height: 50,
                  width: 80,
                )),
            Positioned.fill(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project['customerName'],
                      style: themes.bodyText1.copyWith(color: whitich),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.calendar_month_sharp,
                          color: whitich,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            Text('S: ${project['dateTime']}',
                                style: themes.bodyText2
                                    .copyWith(fontSize: 12, color: whitich)),
                            Text('E: ${project['dateTimeEnd']}',
                                style: themes.bodyText2
                                    .copyWith(fontSize: 12, color: whitich))
                          ],
                        )
                      ],
                    ),
                    Row(children: [
                      Text(
                        '${project['total']} DA',
                        style: themes.buttonText.copyWith(color: lightGreen),
                      ),
                      const Spacer(),
                      Container(
                          height: 24,
                          width: 107,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(240, 152, 25, 1),
                                    Color.fromRGBO(237, 222, 93, 1)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'images/product_page_icon.svg'),
                                Text('${project['productsCount']} products',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: whitich,
                                        fontWeight: FontWeight.w500))
                              ]))
                    ])
                  ]),
            ),
          ],
        )),
    onTap: () {
      Get.to(ProjectDisplay(project: project));
    },
  );
}
