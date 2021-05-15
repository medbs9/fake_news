//import 'package:fake_news/screens/authentification.dart';
import 'package:fake_news/screens/authentification.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  static String id = 'Splashscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue[800],
          Colors.blue[500],
          Colors.lightBlue[400]
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //We take the image from the assets
            /*Image.asset(
              'assets/logo.png',
              height: 300,
              width: 150,
            ),*/
            SizedBox(
              height: 20,
            ),
            //Texts and Styling of them
            Text(
              'Bienvenue à  !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            Text(
              'xxxxxxxxxxxxxxxx',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: 80,
            ),
            //Our MaterialButton which when pressed will take us to a new screen named as
            //LoginScreen
            Padding(
              padding: EdgeInsets.only(left: 80.0, right: 80.0),
              child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Commencer',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Authentification()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
