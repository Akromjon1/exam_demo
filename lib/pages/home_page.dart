import 'dart:convert';

import 'package:exam_app_2/model/recipient_model.dart';
import 'package:exam_app_2/services/pref_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/db_service.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void loadObject()async{
      Prefs.loadRecipient().then((recipient) => print(recipient.toString()));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  loadObject();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: const [
            SizedBox(width: 20,),
            Text("Beneficiary", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ],
        ),
        centerTitle: false,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(100),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                  child: const TextField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        icon: Icon(Icons.search)

                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Recipients", style: TextStyle(color: Colors.grey, fontSize: 25, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),)
              ],
            ),
          ),),
      ),
      //body: HomeItem(title: "dsfads", phoneNumber: "34324124132",),
      // body: recipient != null ?
      // ListView.builder(
      //   physics: const NeverScrollableScrollPhysics(),
      //   shrinkWrap: true,
      //   itemCount: 1,
      //   itemBuilder: (context, index) {
      //
      //     return HomeItem(phoneNumber: recipient!.phoneNumber,title: recipient!.name,
      //
      //     );
      //   },
      // ):Center(child: Text(recipient.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DetailsPage.id);
          //DBService.setData("isLight", !DBService.getData("isLight"));
        },
        child: const Center(child: Icon(Icons.add, color: Colors.white, size: 50,)),
      ),
    );
  }
}
