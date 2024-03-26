import 'package:chatapp_flutter/components/my_button.dart';
import 'package:chatapp_flutter/components/my_textfield.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwardController = TextEditingController();
  final void Function()? onTap;
   LoginPage({super.key
     ,
     required this.onTap,
   });
   void login(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message,
          size: 60,
          color: Theme.of(context).colorScheme.primary,
             ),
          SizedBox(
            height: 50,
          ),
          Text("welcome back ,you have been missed",
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16
          ),),
          const SizedBox(
            height: 25,
          ),
          MyTestField(
              hintText: "Email",
            obscureText: false,
            controller : _emailController
          ),
          const SizedBox(
            height: 10,
          ),
          MyTestField(
              hintText: "passward",
            obscureText: true,
              controller : _passwardController
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            text: "Login",
            onTap: login,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member? ",
              style: TextStyle(
                color: Colors.grey.shade500
              ),),
              GestureDetector(
                onTap: onTap,
                child: Text("Register now",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                    fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          )

        ],
      ),
    );
  }
}
