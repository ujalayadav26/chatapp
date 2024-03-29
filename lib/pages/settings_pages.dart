import 'package:flutter/material.dart';
class SettingsPages extends StatelessWidget {
  const SettingsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",
        style: TextStyle(
            color: Colors.grey.shade500
        ),),
      ),
    );
  }
}
