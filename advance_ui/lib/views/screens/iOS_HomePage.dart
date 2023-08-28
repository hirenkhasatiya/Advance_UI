import 'package:advance_ui/controller/platform_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class iOSHomePage extends StatelessWidget {
  const iOSHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("iOS App"),
        trailing: Transform.scale(
          scale: 0.8,
          child: Consumer<platformcontroller>(
            builder: (context, Provider, child) {
              return CupertinoSwitch(
                  value: Provider.isandroid,
                  onChanged: (val) {
                    Provider.changePlatform();
                  });
            },
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 40,
          ),
        ),
      ),
    );
  }
}
