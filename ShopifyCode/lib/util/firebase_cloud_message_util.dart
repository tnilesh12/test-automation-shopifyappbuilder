import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopify_code/modelClass/notification.dart';
import 'package:shopify_code/modelClass/src/shopify_user/shopify_user.dart';
import 'package:shopify_code/repository/ApiConst.dart';
import 'package:shopify_code/repository/ApiRepository.dart';
import 'package:shopify_code/repository/ApiResponse.dart';
import 'package:shopify_code/session/session.dart';
import 'package:shopify_code/util/utils.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  debugPrint(
      '---------------------notification(${notificationResponse.id}) action tapped: ---------------------'
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    debugPrint(
        '---------------------notification action tapped with input: ${notificationResponse.input}---------------------');
  }
}

class FirebaseCloudMessageUtil {
  static Future<String?> GetToken() async {
    String? token = "";
    try {
      token = await FirebaseMessaging.instance.getToken();
      debugPrint("---------------------firebase token:");
      debugPrint(token);
    } catch (e) {}
    var deviceId = await Utils.getId();
    debugPrint("---------------------device id");

    // Future.delayed(Duration(milliseconds: 5000));

    ShopifyUser? shopifyUser = await Session().getLoginData();
    debugPrint(
        "-------add customerData(shopifyUser) called--------${shopifyUser}");
    if (shopifyUser == null) {
      debugPrint(
          "-------add customerData api called--------" + deviceId.toString());
      String deviceName = Platform.isAndroid ? "Android" : "IOS";
      var formData = {
        "device_id": deviceId,
        "device_name": deviceName,
        "fcm_token": token
      };
      ApiResponse response =
          await ApiRepository.postAPI(ApiConst.addCustomer, formData);
      debugPrint("-------------response${response.data["result"]}");
      shopifyUser = ShopifyUser.fromJson(response.data["result"]);
      debugPrint("-------shopifyUser --------${shopifyUser.toJson()}");
      // Session().setShopifyUserData(shopifyUser);
      Session().setLoginData(shopifyUser);
    }
    return token;
  }

  static Future<void> initialize() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    var androidInitialize =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOSInitialize = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestSoundPermission: true,
        requestCriticalPermission: true,
        requestBadgePermission: true);
    var initializationsSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);

    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        debugPrint(
            "here is click ${notificationResponse.notificationResponseType}");
        debugPrint("here is click ${notificationResponse.payload}");

        // NotificationModel notificationModel =
        // NotificationModel.fromJson(json.decode(notificationResponse.payload!));
        // // // PageRoutes(context, notificationModel);
        // RouteGenerate.ManageUserClick(
        //     context, notificationModel.route!,
        //     data: notificationModel);

        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            break;
          case NotificationResponseType.selectedNotificationAction:
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    debugPrint(
        '---------------------User granted permission: ${settings.authorizationStatus}');
    GetToken();
    //background app
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    //foreground app
    /*
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(
          '---------------------Got a message while in the foreground!---------------------');
      debugPrint(
          '---------------------Message data: ${message.data}---------------------');
      showNotification(message, flutterLocalNotificationsPlugin, true);
      // if (message.notification != null) {
      if (message.data != null) {
        debugPrint(
            '---------------------Message also contained a notification: ${message.data}---------------------');
       
      }
    });

    //app opened from backgound (not terminated)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('---------------------Message clicked!---------------------');
      debugPrint(
          '---------------------App was openend by a notification from background.---------------------');
      debugPrint('title${message.data["title"]}');

      /*    showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('AlertDialog Title'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('App was openend by a notification from background.'),
                    Text('title${message.notification!.title}'),
                    Text('body${message.notification!.body}'),
                    Text('order_id${message.data["order_id"]}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    */
    });
    */
  }

//
  static Future<void> showNotification(RemoteMessage message,
      FlutterLocalNotificationsPlugin fln, bool data) async {
    debugPrint("---------------------showNotification---------------------");
    String? _title;
    String? _body;
    String? _image;
    // String? _type;
    var _type;
    if (data) {
      debugPrint(
          "---------------------showNotification if block---------------------");
      _title = message.data['title'];
      _body = message.data['body'];
      _image = //"https://plus.unsplash.com/premium_photo-1711134826547-169d7de16190?q=80&w=1846&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
          (message.data['image'] != null && message.data['image'].isNotEmpty)
              ? message.data['image'].startsWith('http')
                  ? message.data['image']
                  : 'storage/app/public/notification/${message.data['image']}'
              : null;
      _type = message.data['type'];
      // debugPrint(
      //     "-firebase cloud messaging------$_title----$_body------$_orderID--------$_image--------$_type--------");
    } else {
      debugPrint(
          "showNotification else block ${message.notification!.title} ${message.notification!.body} ${message.notification!.titleLocKey}");
      _title = message.notification!.title;
      _body = message.notification!.body;
      if (Platform.isAndroid) {
        _image = (message.notification!.android!.imageUrl != null &&
                message.notification!.android!.imageUrl!.isNotEmpty)
            ? message.notification!.android!.imageUrl!.startsWith('http')
                ? message.notification!.android!.imageUrl
                : 'storage/app/public/notification/${message.notification!.android!.imageUrl}'
            : null;
      } else if (Platform.isIOS) {
        _image = (message.notification!.apple!.imageUrl != null &&
                message.notification!.apple!.imageUrl!.isNotEmpty)
            ? message.notification!.apple!.imageUrl!.startsWith('http')
                ? message.notification!.apple!.imageUrl
                : 'storage/app/public/notification/${message.notification!.apple!.imageUrl}'
            : null;
      }
    }
    // debugPrint(
    //     "-------------recovered data---- ${_title} ${_body} ${_orderID} $_image----------------");
    if (_image != null && _image.isNotEmpty) {
      try {
        await showBigPictureNotificationHiddenLargeIcon(
            _title!, _body!, _image, fln, "");
      } catch (e) {
        await showBigTextNotification(_title!, _body!, fln, "");
      }
    } else {
      debugPrint(
          "---------------------showBigTextNotification called---------------------");
      await showBigTextNotification(_title!, _body!, fln, "");
    }
  }

  static Future<void> showTextNotification(String title, String body,
      String orderID, FlutterLocalNotificationsPlugin fln) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your-channel-id',
      'your-channel-name',
      playSound: true,
      importance: Importance.max, //imp
      priority: Priority.max, //imp
    );
    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      // sound: ""
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosDetails);
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigTextNotification(String title, String body,
      FlutterLocalNotificationsPlugin fln, String payload) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body,
      htmlFormatBigText: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your-channel-id',
      'your-channel-name',
      importance: Importance.max,
      styleInformation: bigTextStyleInformation,
      priority: Priority.max,
      playSound: true,
    );
    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      // sound: ""
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosDetails);
    await fln.show(0, title, body, platformChannelSpecifics, payload: payload);
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(
      String title,
      String body,
      String image,
      FlutterLocalNotificationsPlugin fln,
      String payload) async {
    final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
    final String bigPicturePath =
        await _downloadAndSaveFile(image, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      hideExpandedLargeIcon: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
      summaryText: body,
      htmlFormatSummaryText: true,
    );
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your-channel-id',
      'your-channel-name',
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      priority: Priority.max,
      playSound: true,
      styleInformation: bigPictureStyleInformation,
      importance: Importance.max,
    );
    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      // sound: ""
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosDetails);
    await fln.show(0, title, body, platformChannelSpecifics, payload: payload);
  }

  static Future<String> _downloadAndSaveFile(
      String url, String fileName) async {
    try {
      // Get the application documents directory
      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$fileName';
      // Log the file path
      debugPrint('Saving file to: $filePath');
      // Make the HTTP request to download the file
      final Response response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      // Create the file and write the response data
      final File file = File(filePath);
      await file.writeAsBytes(response.data);
      // Return the file path
      return filePath;
    } catch (e) {
      // Log the error and rethrow it
      debugPrint('Error downloading and saving file: $e');
      rethrow;
    }
  }

  static void getInitialMessage(
      BuildContext context, Function(NotificationModel) callback) async {
    // RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    try {
      // await Future.delayed(const Duration(seconds: 5), (){});
      NotificationModel? message = await Session().getNotificationData();
      debugPrint(
          '--------message $message-------------message.data---------------------');
      debugPrint(
          '---------------------App was openend by a notification. -> getInitialMessage called...---------------------');
      // debugPrint(
      //     '--------message $message-------------message.data  ${message!.toJson()}---------------------');

      if (message != null) {
        callback.call(message);

        // PageRoutes(context, message);
      } else {
        debugPrint(
            '---------------------App was openend by a notification. -> getInitialMessage called...but message is null---------------------');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  debugPrint('------------_firebaseMessagingBackgroundHandler---------');
  NotificationModel notificationModel =
      NotificationModel.fromJson(message.data);
  bool val = await Session().setNotificationData(notificationModel);
  debugPrint('------------setNotificationData return  val  $val---------');
  debugPrint(
      "---------------------Handling a background message: ${message.messageId}---------------------");
  // FirebaseCloudMessageUtil.showNotification(
  //     message, flutterLocalNotificationsPlugin, false);
}
