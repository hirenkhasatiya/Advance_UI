import 'package:advance_ui/controller/dateTime_Controller.dart';
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
          IconButton(
              onPressed: () {
                Provider.of<platformcontroller>(context, listen: false)
                    .changePlatform();
              },
              icon: Icon(Icons.apple_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Builder(builder: (context) {
                return Column(
                  children: [
                    ElevatedButton(
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
                      child: const Text("Modal Sheet Button"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        DateTime? DT = await showDatePicker(
                          context: context,
                          initialDate: Provider.of<dateTimecontroller>(
                                context,
                              ).DT ??
                              DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now().add(
                            const Duration(days: 4),
                          ),
                        );
                        if (DT != null) {
                          Provider.of<dateTimecontroller>(context,
                                  listen: false)
                              .dateTimeChange(dateTime: DT);
                        }
                      },
                      icon: Icon(Icons.date_range),
                      label: const Text("Date"),
                    ),
                    Consumer<dateTimecontroller>(
                        builder: (context, Provider, child) {
                      return Text(
                          "${Provider.DT!.day}/${Provider.DT!.month}/${Provider.DT!.year}");
                    }),
                    ElevatedButton.icon(
                      onPressed: () async {
                        TimeOfDay? TD = await showTimePicker(
                          context: context,
                          initialTime: Provider.of<dateTimecontroller>(context,
                                      listen: false)
                                  .TD ??
                              TimeOfDay.now(),
                        );
                        if (TD != null) {
                          Provider.of<dateTimecontroller>(context,
                                  listen: false)
                              .TimeChange(time: TD);
                        }
                      },
                      icon: Icon(Icons.watch_later_outlined),
                      label: const Text("Time"),
                    ),
                    Consumer<dateTimecontroller>(
                        builder: (context, Provider, child) {
                      return Text(
                          "${Provider.TD!.hour % 12}:${Provider.TD!.minute}");
                    })
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
