import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giff_dialog/giff_dialog.dart';

import '../controllers/settings_controller.dart';

class ToLateToSoon extends ConsumerWidget {
  const ToLateToSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State management
    final settingsController = ref.watch(settingsControllerProvider);

    return AssetGiffDialog(
      key: const Key("NetworkDialog"),
      image: Image.asset(
        "assets/images/gif-time.gif",
        fit: BoxFit.cover,
      ),
      entryAnimation: EntryAnimation.bottom,
      title: const Text(
        'Not permitted to register',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
      ),
      description: Text(
        'Registration is only possible ${settingsController.getRegistrationStartTime()} minutes before and after the start of a training.',
        textAlign: TextAlign.center,
      ),
      onOkButtonPressed: () {
        Navigator.of(context).pop();
      },
      onlyOkButton: true,
    );
  }
}
