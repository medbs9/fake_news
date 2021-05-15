import 'package:fake_news/screens/homepage.dart';
import 'package:fake_news/providers/ModelHud.dart';
import 'package:fake_news/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:fake_news/screens/signup.dart';
import 'package:fake_news/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class Authentification extends StatefulWidget {
  static String id = 'Authentification';

  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  String email, password;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModelHud>(context).isLoading,
          child: Form(
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
                  height: 80,
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
                      password = value;
                    },
                    icon: Icons.lock,
                    hint: 'Enter your password'),
                SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: Builder(
                        builder: (context) => TextButton(
                              onPressed: () async {
                                final modelhud = Provider.of<ModelHud>(context,
                                    listen: false);
                                modelhud.changeisLoading(true);
                                if (_globalKey.currentState.validate()) {
                                  _globalKey.currentState.save();
                                  try {
                                    final authresult = await auth.signIn(
                                        email.trim(), password.trim());
                                    modelhud.changeisLoading(false);
                                    Navigator.pushNamed(context, Homepage.id);
                                    Fluttertoast.showToast(
                                        msg: 'operation succeeded');
                                  } catch (e) {
                                    modelhud.changeisLoading(false);
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
                                'login',
                                style: TextStyle(color: Colors.black),
                              ),
                            ))),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'don\'t have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Signup.id);
                      },
                      child: Text(
                        'Sign up',
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
          ),
        ));
  }
}
