import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maxmagri/model/addressModel.dart';
import 'package:maxmagri/model/user_model.dart';

class SendData extends StatefulWidget {
  const SendData({Key? key}) : super(key: key);

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {

 // CollectionReference users = FirebaseFirestore.instance.collection('users');

   FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser() async {

    // convert the usermodle to map a object
    Map<String, dynamic> userMap = user.toJson();

    // convert the nested custom object to a map object
    userMap['address'] = {
      'district': user.address!.district!.toJson(),
      'tehisal': user.address!.tehisal!.toJson(),
    };
    //  save the usermap to firebase firestore
    firestore.collection("users").doc(user.userID.toString()).set(userMap).
    then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));

  }


  UserModel user = UserModel(
      name: 'John',
      usertype: 'admin',
      userID: 123,
      cnic: 456,
      phoneNum: 789,
      address: Address(
        district: District(
          ferozepur: 'Ferozepur district',
          jalandhar: 'Jalandhar district',
          mansa: 'Mansa district',
          pathankot: 'Pathankot district',
          barnala: 'Barnala district',
        ),
        tehisal: Tehisal(
          lahore: 'Lahore Tehsil',
          okara: 'Okara Tehsil',
          shawial: 'Shawial Tehsil',
          pattoki: 'Pattoki Tehsil',
          nodra: 'Nodra Tehsil',
        ),
      ),
  );
 // Map<String, dynamic> userData = user.toJson();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Send Data"),
      ),
      body: SafeArea(child: Center(
        child: ElevatedButton(
            onPressed: () {
              addUser();
            },
            child: Text("Send Data")),
      )),
    );
  }
}
