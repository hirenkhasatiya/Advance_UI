import 'package:advance_ui/controller/platform_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class androidHomePage extends StatelessWidget {
  const androidHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Android"),
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
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        barrierColor: Colors.blue.shade50.withOpacity(0.6),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.purple,
                          );
                        });
                  },
                  child: const Text("Modal Sheet Botton"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
