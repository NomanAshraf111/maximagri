import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maxmagri/model/user_model.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text("Something went wrong");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text("Loading...");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      UserModel user =  UserModel.fromJson(data);

                      return Column(
                        children: [
                          Card(
                            child: ListTile(
                              title: Text(
                                'District: ${user.address?.tehisal?.lahore}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              subtitle: Text(user.usertype!),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                // Navigate to user detail screen
                              },
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(
                                'District: ${user.address?.district?.jalandhar}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              subtitle: Text(
                                'Phone Num: ${user.phoneNum}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                // Navigate to user detail screen
                              },
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(
                                'District: ${user.address?.district?.jalandhar}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              subtitle: Text(
                                'Phone Num: ${user.phoneNum}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                // Navigate to user detail screen
                              },
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text(
                                'District: ${user.name}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              subtitle: Text(
                                'Phone Num: ${user.usertype}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                // Navigate to user detail screen
                              },
                            ),
                          ),
                        ],
                      );
            }).toList(),
          );
        },
      ),
    );
  }
}
