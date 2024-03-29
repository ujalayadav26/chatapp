
import 'package:chatapp_flutter/components/my_button.dart';
import 'package:chatapp_flutter/components/my_textfield.dart';
import 'package:chatapp_flutter/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
   LoginPage({super.key
     ,
     required this.onTap,
   });
   void login(BuildContext context) async{
     final authService = AuthService();
     try{
       await authService.signInWithEmailPassword(
         _emailController.text,
         _passwordController.text
       );

     }
     catch(e){
       showDialog(
           context: context,
           builder: (context) => AlertDialog(
               title: Text(e.toString()),
           ));
     }
   }

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
          MyTextField(
              hintText: "Email",
            obscureText: false,
            controller : _emailController
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
              hintText: "password",
            obscureText: true,
              controller : _passwordController
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            text: "Login",
            onTap: (){
              login(context);

            }

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
