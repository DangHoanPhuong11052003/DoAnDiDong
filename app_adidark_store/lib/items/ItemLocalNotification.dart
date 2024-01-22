import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationAPI{
  static Future<void> requestPermissionLocalNotification() async{
   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }
  static Future<void> initializaLocalNotifications()async{
    final flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid=AndroidInitializationSettings('ic_launcher');
    const initializationSettingsDarwin=DarwinInitializationSettings(
      onDidReceiveLocalNotification: iosShowNotification
    );
    
    const initializationSettings=InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void iosShowNotification(int id,String?title,String?body,String? data){
    showNotification(id: id,title: title,body: body,data: data);
  }

  static void showNotification({
    required int id,
    String? title,
    String? body,
    String? data
  }){
    const androidDetail=AndroidNotificationDetails("channelId", "channelName",playSound: true,importance: Importance.max,priority: Priority.high);

    const notificationDetails=NotificationDetails(
      android: androidDetail,
      iOS:DarwinNotificationDetails(
        presentSound: true,
        presentAlert: true,
      )
    );

    final flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails);

  }
  
}