// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hideText = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 35.0),
              buildText("Hello."),
              buildText("Welcome Back."),
              const SizedBox(height: 70.0),
              buildSmalText("USERNAME"),
              TextField(),
              const SizedBox(height: 40),
              buildSmalText("PASSWORD"),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    obscureText: hideText,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        hideText == false ? hideText = true : hideText = false;
                      });
                    },
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(8.0))),
                    child: Text("Show",
                        style: GoogleFonts.lato(
                            fontSize: 16.0, fontWeight: FontWeight.w700)),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(width * 0.60, 30, 0, 0),
                child: const Text("Forgot Password ?"),
              ),
              const SizedBox(height: 60.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: width * .40)),
                ),
                child: Text("Login",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 30.0),
              Center(child: buildSmalText("Create Account"))
            ],
          ),
        ),
      ),
    );
  }

  Text buildSmalText(String text) {
    return Text(
      text,
      style: GoogleFonts.lato(fontWeight: FontWeight.normal),
    );
  }

  Text buildText(String text) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}
