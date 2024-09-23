import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:glaxit_portal/ui/home/home_screen.dart';
import 'package:glaxit_portal/widgets/bottom%20navigation%20bar/bottom_nav_bar.dart';
import 'package:glaxit_portal/widgets/round_button.dart';
import 'package:glaxit_portal/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

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
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Positioned(
                top: 50,
                child: Container(
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width,
                  child: Image(image: AssetImage('assets/images/glaxit.png', )),),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *.05),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Email',
                      svgIconPath: 'assets/icons/user.svg'),
                  SizedBox(height: MediaQuery.of(context).size.height *.02),
                  CustomTextFormField(
                    obscureText: _obscureText,
                      controller: _passwordController,
                      suffixIcon: IconButton(onPressed: _toggleVisibility, icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),),
                      hintText: 'Password',
                      svgIconPath: 'assets/icons/lock.svg',),
                  SizedBox(height: MediaQuery.of(context).size.height *.03),
                  CustomButton(text: 'Log In', fontWeight: FontWeight.w600,onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
                  })
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
