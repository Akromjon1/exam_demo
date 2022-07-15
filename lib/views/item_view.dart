import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  String title;
  String phoneNumber;
  HomeItem({Key? key, required this.title, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(phoneNumber),
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text("Send", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),),
      ),
    );
  }
}
