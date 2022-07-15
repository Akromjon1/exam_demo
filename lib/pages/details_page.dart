import 'package:exam_app_2/model/recipient_model.dart';
import 'package:exam_app_2/pages/home_page.dart';
import 'package:exam_app_2/services/pref_service.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const String id = "details_page";

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();

  void saveObject()async{
    if(nameController.text.isNotEmpty && phoneController.text.isNotEmpty && relationshipController.text.isNotEmpty){
     String name = nameController.text.toString().trim();
     String relationship = relationshipController.text.toString().trim();
     String phone = phoneController.text.toString().trim();

     Recipient recipient = Recipient(name: name, phoneNumber: phone, relationship: relationship);
     await Prefs.storeRecipient(recipient);
     await Prefs.loadRecipient().then((val) => print(val.toString()));
    }
    return;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Beneficiary", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: relationshipController,
              decoration: InputDecoration(

                labelText: "Relationship",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(

                labelText: "Phone Number",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),

            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  GestureDetector(
        onTap: () {
            saveObject;
            Navigator.pushReplacementNamed(context, HomePage.id);
        } ,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          width: double.infinity,
          height: 50,
          child: const Center(child: Text("Save", style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}