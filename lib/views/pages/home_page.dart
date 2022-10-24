import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/modules/prject.dart';
import 'package:dovi_me/modules/user.dart';
import 'package:dovi_me/views/pages/project_detials.dart';
import 'package:dovi_me/views/widgtes/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
//////
  List<Project> _getPojects(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => Project(
              id: doc['id'],
              customerName: doc['customerName'] ?? '',
              dateTime: doc['dateTime'],
              ownerId: doc['ownerId'] ?? '',
              discount: doc['discount'] ?? 0,
              subTotal: doc['subTotal'] ?? 0,
              total: doc['total'] ?? 0,
            ))
        .toList();
  }

  ///
  final CollectionReference<Map<String, dynamic>> projects =
      FirebaseFirestore.instance.collection('projects');
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserAccount>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawerWidget(context),
      appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(userController.photoUrl!)),
            )
          ]),
      body: StreamBuilder(
          stream: projects
              // .where('ownerId', isEqualTo: userController.id)
              .snapshots()
              .map((event) {
            print('event size ${event.size}');
            return _getPojects(event);
          }),
          builder: (context, snapshot) {
            print('snapshot: ${snapshot.data}');
            return Center(
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
            );
          }),
    );
  }
}
