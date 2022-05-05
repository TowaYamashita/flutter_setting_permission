import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // 通知を承認していなければ承認ダイアログを表示
            if (!await Permission.notification.isGranted) {
              await [Permission.notification, Permission.camera].request();
            }
            // 通知設定画面を開く
            // iosでは通知設定画面を直接開けず、アプリの設定画面が開けない
            AppSettings.openNotificationSettings();
          },
          child: const Text('notification setting'),
        ),
      ),
    );
  }
}
