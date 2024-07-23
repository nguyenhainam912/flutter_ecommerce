import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TDialog {
  static Future<bool> confirm({required title, required content}) async {
    return await showDialog(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
