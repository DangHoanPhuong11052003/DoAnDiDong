import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationAPI{
  static final notification=FlutterLocalNotificationsPlugin();

  static Future _notificationDetail() async{
    return const NotificationDetails(
      android: AndroidNotificationDetails("channel id", "channel name",channelDescription: "channel description",importance: Importance.max),
      iOS: DarwinNotificationDetails()
    );
  }

  static Future showNotifi({
    int id=0,
    String? title,
    String? body,
    String? payload
  })async=>notification.show(id, title, body, await _notificationDetail(),payload: payload);
}