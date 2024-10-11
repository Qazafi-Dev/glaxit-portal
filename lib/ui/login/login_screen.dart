import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:glaxit_portal/constant/base_url.dart';
import 'package:glaxit_portal/modals/user_login.dart';
import 'package:glaxit_portal/ui/home/home_screen.dart';
import 'package:glaxit_portal/widgets/bottom%20navigation%20bar/bottom_nav_bar.dart';
import 'package:glaxit_portal/widgets/round_button.dart';
import 'package:glaxit_portal/widgets/text_field.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  var _isLoading = false;
  Future<List<UserLogin>?> loginEmployee() async {
    print(_emailController.text);
    setState(() => _isLoading = true);
    var headers = {
      'Accept': 'application/json',
      'Accept': 'application/javascript'
    };
    final response = await http
        .post(Uri.parse('$APP_BASE_URL/login.php'), headers: headers, body: {
      'em-login-email': 'abc@gmail.com',
      // _emailController.text,
      'em-login-password': 'john@realtechcrm'

      // _passwordController.text,
    });
    print(response);

    final data = jsonDecode(response.body);
    final statusCode = data['status'];
    if (statusCode == 'success') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      print('else');
      AlertDialog alert = AlertDialog(
        title: Text("My title"),
        content: Text("This is my message."),
      );
    }
    setState(() => _isLoading = false);
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Positioned(
                    top: 50,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.width,
                      child: const Image(
                          image: AssetImage(
                        'assets/images/glaxit.png',
                      )),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          svgIconPath: 'assets/icons/user.svg'),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      CustomTextFormField(
                        obscureText: _obscureText,
                        controller: _passwordController,
                        suffixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'Password',
                        svgIconPath: 'assets/icons/lock.svg',
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .03),
                      ElevatedButton.icon(
                        onPressed: _isLoading ? null : loginEmployee,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          backgroundColor: Color(0xff3880EE),
                          surfaceTintColor: Color(0xff3880EE),
                          minimumSize: Size(200, 10),
                        ),
                        icon: _isLoading
                            ? Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : null,
                        label: const Text(
                          'SUBMIT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // CustomButton(
                      //     text: 'Log In',
                      //     fontWeight: FontWeight.w600,
                      //     onPressed: () {
                      //       loginEmployee();
                      //       // Navigator.pushReplacement(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) => BottomNavBar()));
                      //     })
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
