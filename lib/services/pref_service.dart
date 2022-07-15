import 'dart:convert';

import 'package:exam_app_2/model/recipient_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  static saveRecipient(Object test)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(test);
    prefs.setString("test", json);
  }

  // static loadRecipient()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getString("test");
  // }

  static storeRecipient(Recipient recipient) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(recipient);
    prefs.setString('recipient', stringUser);
  }

  static Future<Recipient?> loadRecipient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString('recipient');
    if(stringUser == null || stringUser.isEmpty){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringUser);
    return Recipient.fromJson(map);

  }
}