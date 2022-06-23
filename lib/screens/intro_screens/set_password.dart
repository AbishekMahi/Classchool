// ignore_for_file: unnecessary_const, prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../buttons/submit_button.dart';
import '../buttons/textfield.dart';

// ignore: must_be_immutable
class SetPassword extends StatelessWidget {
  SetPassword({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [Color(0XFFBD94FA), Color(0XFF7455F7)],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              reverse: true,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset('assets/lottie/set_password.json', width: 250),
                    Text(
                      'Set strong password',
                      style: GoogleFonts.jost(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PwArea(
                      labelText: 'New Password',
                      hintText: 'Enter new password',
                      prefixIcon: EvaIcons.lockOutline,
                    ),
                    PwArea(
                      labelText: 'Confirm Password',
                      hintText: 'Re-Enter password',
                      prefixIcon: EvaIcons.lockOutline,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Submit_Button(
                      btntxt: 'LET\'S GO',
                      fontSize: 24,
                      ontouch: () {
                        _submit();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}