import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notification.show(id, title, body, await _notificationDetails());

  static Future init({bool isShedule = false}) async {
    const ios = IOSInitializationSettings();
    const android = AndroidInitializationSettings("@midmap/ic_launcher");
    const settings = InitializationSettings(android: android, iOS: ios);
    await _notification.initialize(
      settings,
      onSelectNotification: (payload) async {},
    );
  }
  static Future _notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails('1', 'channel name',
            icon: "@mipmap/ic_launcher",
            channelDescription: 'your channel description',
              priority: Priority.max,
    
            importance: Importance.max),
        iOS: IOSNotificationDetails());
  }
  
}
