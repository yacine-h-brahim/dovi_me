import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference<Map<String, dynamic>> projects =
      FirebaseFirestore.instance.collection('projects');
//////
  Stream<QuerySnapshot<Map<String, dynamic>>> projectsFromFirestore(
      String ownerId) {
    return projects.where('ownerId', isEqualTo: ownerId).snapshots();
  }

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
      body: Center(
        child: StreamBuilder(
            stream: projectsFromFirestore(userController.id!),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString(),
                    style: const TextStyle(color: Colors.red));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return Padding(
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
                            itemCount: snapshot.data!.size,
                            itemBuilder: (context, index) => card(
                                index: index,
                                project: snapshot.data!.docs[index].data(),
                                context: context)),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
