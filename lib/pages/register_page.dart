
import 'package:chatapp_flutter/components/my_button.dart';
import 'package:chatapp_flutter/components/my_textfield.dart';
import 'package:chatapp_flutter/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();
    if(_passwordController.text ==_confirmPasswordController.text){
      try{
        _auth.signUpWithEmailPassword
          (
            _emailController.text,
            _passwordController.text);
      }
      catch(e){
        throw Exception(
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ))
            );
      }
      }
    else{
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Password does not match"),
          )
    );
    }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Create your account",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextField(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextField(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _confirmPasswordController,
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            text: "Register",
            onTap: () => register(context),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}