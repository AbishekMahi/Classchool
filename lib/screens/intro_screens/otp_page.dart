// ignore_for_file: unnecessary_const, prefer_const_constructors, avoid_print, sort_child_properties_last, depend_on_referenced_packages, use_build_context_synchronously, camel_case_types, must_be_immutable

import 'package:classchool/screens/intro_screens/set_password.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/textfield.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);
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
                    Lottie.asset('assets/lottie/otp.json', width: 200),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Enter verification code sent to your mobile number',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jost(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            height: 0,
                            color: Colors.white),
                      ),
                    ),
                    CustomTextField(
                      labelText: 'Enter the 6-digit code',
                      hintText: 'Enter your OTP',
                      maxlength: 6,
                      prefixIcon: Icons.numbers,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*?[0-9]).{6,}$').hasMatch(value)) {
                          return 'Enter valid OTP!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF8EFF6B)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Verify',
                            style: GoogleFonts.jost(
                                fontSize: 20,
                                color: Color(0xFF3F3F3F),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        onPressed: () {
                          _submit();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetPassword(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 150,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Resend code in 60 secs',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jost(
                        fontSize: 18,
                        color: Colors.white,
                      ),
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
