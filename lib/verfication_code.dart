import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxmagri/home_screen.dart';

class VerficationPage extends StatefulWidget {

  String verficationId;

   VerficationPage({Key? key, required this.verficationId}) : super(key: key);

  @override
  State<VerficationPage> createState() => _VerficationPageState();
}

class _VerficationPageState extends State<VerficationPage> {

  final verficationController = TextEditingController();

  final _auth  = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LogIn"),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40,),
            TextFormField(
              controller: verficationController,
              decoration: InputDecoration(
                hintText: 'enter 6 digit',

              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async{
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verficationId,
                  smsCode: verficationController.text);
              try{
               await _auth.signInWithCredential(credential);
               Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));

              }catch(e){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

              }

            }, child: Text("Verfiy"))
          ],
        ),
      ),
    );
  }
}
