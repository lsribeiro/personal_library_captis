import 'package:flutter/material.dart';
import 'package:personal_library_captis/presentation/widgets/login/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTextField(hintText: "Login", icon: Icons.person),
              SizedBox(height: 10.0,),
              LoginTextField(hintText: "Password", icon: Icons.lock, obscureText: true,),
              SizedBox(height: 10.0,),
              MaterialButton(onPressed: () => print('Login'), child: Text("LOGIN"), color: Colors.white,)
            ],
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1587270613304-4cc9ef012b92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
