import 'package:advance_ui/controller/platform_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class androidHomePage extends StatelessWidget {
  const androidHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Android"),
        centerTitle: true,
        actions: [
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: Provider.of<platformcontroller>(context).isandroid,
              onChanged: (val) {
                Provider.of<platformcontroller>(context, listen: false)
                    .changePlatform();
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
