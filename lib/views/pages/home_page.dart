import 'package:dovi_me/views/pages/project_detials.dart';
import 'package:dovi_me/views/widgtes/home_card.dart';
import 'package:flutter/material.dart';

import '../../style/themes.dart';
import '../widgtes/drawer.dart';
import '../widgtes/plus_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Themes themes = Themes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawerWidget(context),
      appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('images/tomHeddlaston.jpg')),
            )
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 35),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('All Projects', style: themes.buttonText),
                    plusButton(context, const ProjectDetials())
                  ]),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  itemCount: 4,
                  itemBuilder: (context, index) =>
                      card(index: index, context: context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
