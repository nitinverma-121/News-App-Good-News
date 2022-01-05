import 'package:app1/views/firstscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Authform extends StatefulWidget {
  bool newaccountformedorhadone = false;
  Authform({Key key, this.newaccountformedorhadone}) : super(key: key);

  @override
  _AuthformState createState() => _AuthformState();
}

class _AuthformState extends State<Authform> {
  final _formkey = GlobalKey<FormState>();

  String _email = '';
  String _username = '';
  String _password = '';
  bool _isloginpage = false;

  checkformandstart() {
    final validity = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (validity) {
      _formkey.currentState.save();
      startauth(_email, _password, _username);
    }
  }

  startauth(String email, String password, String username) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      if (_isloginpage) {
        //i directly have to log in now
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        //i already have a account this means
        setState(() {
          widget.newaccountformedorhadone = true;
        });
      } else {
        var result = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = result.user.uid;

        //send the authenticaed data to the firebase
        await FirebaseFirestore.instance.collection('Users').doc(uid).set(
            {'Username': username, 'Email Id': email, 'Time': DateTime.now()});
        //i just created a new account
        setState(() {
          widget.newaccountformedorhadone = true;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 3),
                  borderRadius: BorderRadius.circular(50)),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/news.JPG',
                        ),
                        Text(
                          "G O O D  N E W S",
                          style: TextStyle(
                              fontFamily: 'newone',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _isloginpage == false
                            ? TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "incorrect username";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                onSaved: (value) {
                                  setState(() {
                                    _username = value;
                                  });
                                },
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    _username = value;
                                  });
                                },
                                style: GoogleFonts.roboto(color: Colors.white),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(FontAwesomeIcons.user,
                                      color: Colors.white),
                                  label: Text("E n t e r  U s e r n a m e"),
                                  labelStyle:
                                      GoogleFonts.roboto(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          new BorderSide(color: Colors.yellow)),
                                ))
                            : SizedBox(
                                height: 50,
                              ),
                        SizedBox(height: 10),
                        TextFormField(
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return "incorrect email";
                              }
                              return null;
                            },
                            style: GoogleFonts.roboto(color: Colors.white),
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            onFieldSubmitted: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(FontAwesomeIcons.user,
                                  color: Colors.white),
                              label: Text("E n t e r  E m a i l"),
                              labelStyle:
                                  GoogleFonts.roboto(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      new BorderSide(color: Colors.yellow)),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "incorrect password";
                              } else if (value.length < 6) {
                                return "Weak Password. Keep the Password at least 6 characters long";
                              }
                              return null;
                            },
                            style: GoogleFonts.roboto(color: Colors.white),
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            onFieldSubmitted: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.password, color: Colors.white),
                              label: Text("E n t e r  P a s s w o r d "),
                              labelStyle:
                                  GoogleFonts.roboto(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      new BorderSide(color: Colors.yellow)),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            checkformandstart();
                            //take me now to the main page
                            //but i only want to go when
                            //i made a new account or i
                            //already had one
                            if (widget.newaccountformedorhadone)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Firstscreen(
                                            emailid: this._email,
                                            username: this._username,
                                          )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              _isloginpage == true ? "Login" : "Sign Up ",
                              style: GoogleFonts.adventPro(fontSize: 24),
                            ),
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isloginpage = !_isloginpage;
                            });
                          },
                          child: Text(
                            _isloginpage == true
                                ? "Not a member?"
                                : "Already a member?",
                            style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
