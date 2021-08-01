import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stoicmonk/homescreen.dart';
import 'package:stoicmonk/loginscreen.dart';
import 'package:stoicmonk/utilities/constants.dart';
import 'package:stoicmonk/welcomescreen.dart';
import 'utilities/manntoolbox.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "RegistrationScreen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  MannToolBox _mannToolBox = MannToolBox();
  String email;
  String password;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 7));
    animationController.repeat();
    print(animationController.value);
  }

  //------Functions
  //Animator
  stopRotation() => animationController.stop();
  // stopRotation(){animationController.stop();}
  startRotation() {
    animationController.repeat();
  }
  //Google sign in

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      startRotation();
                    },
                    child: Text("Start Rotation")),
                TextButton(
                    onPressed: () {
                      stopRotation();
                    },
                    child: Text("Stop Rotation")),
              ],
            ),
            Container(
              child: AnimatedBuilder(
                animation: animationController,
                child: Container(
                  // child: Image.network('https://flutter-examples.com/wp-content/uploads/2020/01/yin_yang.png',width: 150, height: 150, fit: BoxFit.contain,),
                  child: Icon(
                    FontAwesomeIcons.connectdevelop,
                    size: 30,
                  ),
                ),
                builder: (BuildContext context, Widget _widget) {
                  return Transform.rotate(
                    angle: animationController.value * 6.3,
                    child: _widget,
                  );
                },
              ),
            ),

            //Gogle sign in

            Container(
              child: MaterialButton(
                color: Colors.deepOrange,
                child: Icon(
                  FontAwesomeIcons.google,
                  size: 32,
                ),
                onPressed: () {
                  final user = signInWithGoogle();
                  if (user != null) {
                    print(user);
                    Navigator.pushNamed(context, HomeScreen.id);
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                },
                child: Container(color: kPrimaryColor, child:Text("Sign in with Google")),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),),),),
            ),

            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              //Password
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    // PAssword Check
                    String validatedPasswordOutput =
                        _mannToolBox.validatePassword(password);
                    if (password == validatedPasswordOutput) {
                      password = validatedPasswordOutput;
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text("Password too small :/"),
                          content: Text(validatedPasswordOutput),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Try again"))
                          ],
                        ),
                        barrierDismissible: true,
                        barrierColor: Colors.black12,
                      );
                    }

                    //-----

                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    } //Implement registration functionality.
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: RichText(
                    text: TextSpan(
                        // style: DefaultTextStyle.of(context).style,
                        children: [
                      TextSpan(
                          text: "Already a user ?",
                          style: TextStyle(color: kLightPrimaryColor)),
                      TextSpan(
                          text: " Log In",
                          style: TextStyle(color: kPrimaryColor)),
                    ]))
                // Text("Already a user ? Log In "),
                ),
          ],
        ),
      ),
    );
  }
}

//TODO: Change UI
//TODO: password min 6 conditions
//TODO: other user info fields
//TODO: login via google
//TODO: login via facebook
//TODO: Dispose the animator
