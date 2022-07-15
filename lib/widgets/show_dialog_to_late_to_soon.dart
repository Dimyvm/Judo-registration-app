import 'package:flutter/material.dart';
import 'package:giff_dialog/giff_dialog.dart';

class ToLateToSoon extends StatelessWidget {
  const ToLateToSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      description: const Text(
        'Registration is only possible 30 minutes before and after the start of a training.',
        textAlign: TextAlign.center,
      ),
      onOkButtonPressed: () {
        Navigator.of(context).pop();
      },
      onlyOkButton: true,
    );
  }
}
