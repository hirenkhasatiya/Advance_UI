import 'package:advance_ui/controller/dateTime_Controller.dart';
import 'package:advance_ui/controller/platform_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class iOSHomePage extends StatelessWidget {
  iOSHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("iOS App"),
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
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoActionSheet(
                        title: const Text("Master in Flutter"),
                        cancelButton: CupertinoButton(
                          onPressed: () {},
                          child: const Text('Cancel'),
                        ),
                        actions: [
                          CupertinoButton(
                              child: const Text("C Language"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          CupertinoButton(
                              child: const Text("CPP Language"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          CupertinoButton(
                              child: const Text("Figma"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          CupertinoButton(
                              child: const Text("Core Flutter"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Cupertino Action Sheet"),
              ),
              CupertinoContextMenu(
                actions: const [
                  CupertinoContextMenuAction(
                    trailingIcon: Icons.favorite,
                    child: Text('Favorite'),
                  ),
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.add_circled,
                    child: Text("Add"),
                  ),
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.delete_solid,
                    child: Text("Delete"),
                  ),
                  CupertinoContextMenuAction(
                    trailingIcon: Icons.cancel_outlined,
                    isDestructiveAction: true,
                    child: Text("Cancel"),
                  ),
                ],
                child: const Text("Cupertino Context Menu"),
              ),
              CupertinoButton(
                child: const Text("Date"),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text("Select Date"),
                      message: SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          initialDateTime: Provider.of<dateTimecontroller>(
                                      context,
                                      listen: false)
                                  .DT ??
                              DateTime.now(),
                          onDateTimeChanged: (date) {
                            Provider.of<dateTimecontroller>(context,
                                    listen: false)
                                .dateTimeChange(dateTime: date);
                          },
                        ),
                      ),
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                        isDestructiveAction: true,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
