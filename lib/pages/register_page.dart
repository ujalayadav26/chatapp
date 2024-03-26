import 'package:chatapp_flutter/components/my_button.dart';
import 'package:chatapp_flutter/components/my_textfield.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwardController = TextEditingController();
  final TextEditingController _confirmpasswardController = TextEditingController();

final void Function()? onTap;

   RegisterPage({super.key,
     required this.onTap
  });
   void register(){}

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
          MyTestField(
              hintText: " confirm passward",
              obscureText: true,
              controller : _confirmpasswardController,
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            text: "register",
            onTap: register,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account ? ",
                style: TextStyle(
                    color: Colors.grey.shade500
                ),),
              GestureDetector(
                onTap: onTap,
                child: Text("login now",
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
