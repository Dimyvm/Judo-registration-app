import 'package:JudoRegistration/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State management
    final settingsController = ref.watch(settingsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instellingen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Card - screensaver
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                  contentPadding: const EdgeInsets.all(12.0),
                  title: const Text(
                    'Screensaver',
                    style: TextStyle(fontSize: 24),
                  ),
                  leading: Container(
                    width: 64.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFF4EC),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Icon(
                      Icons.person,
                      size: 32,
                      color: Color(0xffFAC69E),
                    ),
                  ),
                  subtitle: const Text(
                    'Activated after x Min',
                    style: TextStyle(fontSize: 24),
                  ),
                  trailing: Container(
                    width: 100,
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: Color(0xffFFF4EC),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: DropdownButton(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        isExpanded: true,
                        dropdownColor: const Color(0xffFFF4EC),
                        focusColor: Colors.white,
                        value: settingsController.getScreensaverTime(),
                        style: const TextStyle(
                          color: Color(0xffFAC69E),
                        ),
                        iconEnabledColor: Colors.black,
                        items: <int>[1, 2, 3, 4, 5, 10, 15, 20]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                '$value Min',
                                style: const TextStyle(color: Colors.black),
                              ));
                        }).toList(),
                        hint: const Text(
                          "Selecteer de tijd waarna een screensaver wordt geactiveerd",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (int? value) {
                          settingsController.setScreensaverTime(value!);
                        }),
                  )),
            ),
            // Card - loading data
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                  contentPadding: const EdgeInsets.all(12.0),
                  title: const Text(
                    'Loading data',
                    style: TextStyle(fontSize: 24),
                  ),
                  leading: Container(
                    width: 64.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                        color: const Color(0xffEDF6FF),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Icon(
                      Icons.downloading_outlined,
                      size: 32,
                      color: Color(0xff71B7F2),
                    ),
                  ),
                  subtitle: const Text(
                    'Loading API each x Min',
                    style: TextStyle(fontSize: 24),
                  ),
                  trailing: Container(
                    width: 100,
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: Color(0xffEDF6FF),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: DropdownButton(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        isExpanded: true,
                        dropdownColor: const Color(0xffEDF6FF),
                        focusColor: Colors.white,
                        value: settingsController.getAPIdataEachTime(),
                        style: const TextStyle(
                          color: Color(0xffFAC69E),
                        ),
                        iconEnabledColor: Colors.black,
                        items: <int>[1, 2, 3, 4, 5, 10, 15, 20, 30, 60]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                '$value Min',
                                style: const TextStyle(color: Colors.black),
                              ));
                        }).toList(),
                        hint: const Text(
                          "Selecteer de tijd waarna registreren kan x min voor en na de start van de training",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (int? value) {
                          settingsController.setAPIdataEachTime(value!);
                        }),
                  )),
            ),
            //Card - Registration starting Time
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                  contentPadding: const EdgeInsets.all(12.0),
                  title: const Text(
                    'Registration',
                    style: TextStyle(fontSize: 24),
                  ),
                  leading: Container(
                    width: 64.0,
                    height: 64.0,
                    decoration: BoxDecoration(
                        color: const Color(0xffF5D9DA),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Icon(
                      Icons.app_registration,
                      size: 32,
                      color: Color(0xffF6B1B0),
                    ),
                  ),
                  subtitle: const Text(
                    'Befor & after start of training',
                    style: TextStyle(fontSize: 24),
                  ),
                  trailing: Container(
                    width: 100,
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: Color(0xffF5D9DA),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: DropdownButton(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        isExpanded: true,
                        dropdownColor: const Color(0xffF5D9DA),
                        focusColor: Colors.white,
                        value: settingsController.getRegistrationStartTime(),
                        style: const TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <int>[1, 2, 3, 4, 5, 10, 15, 20, 30, 60]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                              value: value,
                              child: Text(
                                '$value Min',
                                style: const TextStyle(color: Colors.black),
                              ));
                        }).toList(),
                        hint: const Text(
                          "Selecteer de tijd waarna registreren kan x min voor en na de start van de training",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onChanged: (int? value) {
                          settingsController.setRegistrationStartTime(value!);
                        }),
                  )),
            ),
            //Card - Pictures
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12.0),
                title: const Text(
                  'Pictures',
                  style: TextStyle(fontSize: 24),
                ),
                leading: Container(
                  width: 64.0,
                  height: 64.0,
                  decoration: BoxDecoration(
                      color: const Color(0xffDAD8E6),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Icon(
                    Icons.person,
                    size: 32,
                    color: Color(0xff7A749B),
                  ),
                ),
                subtitle: const Text(
                  'loading avatar pictures',
                  style: TextStyle(fontSize: 24),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Switch(
                      activeColor: const Color(0xff7A749B),
                      value: settingsController.loadingAvatarPicturs(),
                      onChanged: (value) {
                        settingsController.setLoadingAvatarPictures(value);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
