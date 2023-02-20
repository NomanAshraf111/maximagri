import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxmagri/verfication_code.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final phonenumController = TextEditingController();

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
              controller: phonenumController,
              decoration: InputDecoration(
                hintText: '+1 234 3455 234',

              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () async{
               await _auth.verifyPhoneNumber(
                 timeout: Duration(seconds: 60),
                  phoneNumber: phonenumController.text,
                   verificationCompleted: (PhoneAuthCredential credential){},
                   verificationFailed: (e){},
                   codeSent: (String verficationId, int? token){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => VerficationPage(verficationId: verficationId,)));
                   },
                   codeAutoRetrievalTimeout: (e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                   },
               );
            }, child: Text("LogIn"))
          ],
        ),
      ),
    );
  }
}
