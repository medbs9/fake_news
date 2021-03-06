import 'package:fake_news/screens/authentification.dart';
//import 'package:find_food/services/adduser.dart';
import 'package:fake_news/services/auth.dart';
import 'package:fake_news/widgets/customtextfield.dart';
//import 'package:find_food/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  static String id = 'Signup';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email, password, name, phone;

  final auth = Auth();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      /*Image(
                        image: AssetImage('assets/logoo.png'),
                      ),*/
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              CustomTextField(
                  onClick: (value) {
                    email = value;
                  },
                  icon: Icons.email,
                  hint: 'Enter your email'),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  onClick: (value) {
                    name = value;
                  },
                  icon: Icons.perm_identity,
                  hint: 'Enter your username'),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  onClick: (value) {
                    password = value;
                  },
                  icon: Icons.lock,
                  hint: 'Enter your password'),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Builder(
                      builder: (context) => TextButton(
                            onPressed: () async {
                              if (_globalKey.currentState.validate()) {
                                _globalKey.currentState.save();
                                try {
                                  final authresult = await auth.signUp(
                                    email.trim(),
                                    password.trim(),
                                  );
                                  print(authresult);

                                  Navigator.pushNamed(
                                      context, Authentification.id);

                                  /*_adduser.adduser(Utilisateur(
                                    uName: name,
                                    uPwd: password,
                                    uemail: email,
                                    uPhone: '0000',
                                    uId: authresult.user.uid,
                                  ));*/
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(e.message)));
                                }
                              }
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.blue[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: Colors.black),
                            ),
                          ))),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'you have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Authentification.id);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
