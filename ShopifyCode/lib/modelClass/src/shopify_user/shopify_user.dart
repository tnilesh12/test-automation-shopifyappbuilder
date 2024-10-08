import 'dart:convert';
import 'package:shopify_code/modelClass/src/shopify_user/address/address.dart';
import 'addresses/addresses.dart';
import 'last_incomplete_checkout/last_incomplete_checkout.dart';

class ShopifyUser {
  Address? defaultAddress;
  Addresses? address;
  String? createdAt;
  String? displayName;
  String? email;
  String? firstName;
  String? id;
  String? shopifyId;
  String? deviceId;
  String? deviceName;
  String? fcmToken;
  String? partnerId;
  String? lastName;
  String? phone;
  List<String>? tags;
  LastIncompleteCheckout? lastIncompleteCheckout;
  String? profileImage;

  ShopifyUser(
      {this.address,
      this.createdAt,
      this.displayName,
      this.email,
      this.firstName,
      this.id,
      this.shopifyId,
      this.deviceId,
      this.deviceName,
      this.fcmToken,
      this.partnerId,
      this.lastName,
      this.phone,
      this.tags,
      this.lastIncompleteCheckout,
      this.profileImage,
      this.defaultAddress});

  static ShopifyUser fromGraphJson(Map<String, dynamic> json) {
    return ShopifyUser(
        defaultAddress: Address.fromJson(json['defaultAddress'] ?? const {}),
        address: Addresses.fromGraphJson(json['addresses'] ?? const {}),
        createdAt: json['createdAt'],
        displayName: json['displayName'],
        email: json['email'],
        firstName: json['firstName'],
        id: json['_id'],
        shopifyId: json['id'],
        deviceId: json['device_id'],
        deviceName: json['device_name'],
        fcmToken: json['fcm_token'],
        partnerId: json['partner_id'],
        lastName: getLastName(json),
        phone: json['phone'],
        tags: _getTagList((json)),
        lastIncompleteCheckout: json['lastIncompleteCheckout'] == null
            ? null
            : LastIncompleteCheckout.fromJson(json['lastIncompleteCheckout']),
        // profileImage: json['profileImage'] == null ? "" : json['profileImage']);
        profileImage:
            json.containsKey(('profileImage')) ? json['profileImage'] : "");
  }

  static String? getLastName(Map<String, dynamic> json) {
    String? lastName = json['lastName'];
    if (lastName == null) {
      lastName = json['displayName'];
      if (lastName != null) {
        if (json['firstName'] == null) {
          lastName = lastName.replaceAll(RegExp(r'\s+'), ' ').trim();
        } else {
          lastName = lastName
              .replaceAll(RegExp(r'\b' + json['firstName'] + r'\b'), '')
              .replaceAll(RegExp(r'\s+'), ' ')
              .trim();
        }
      }
    }
    return lastName;
  }

  ShopifyUser.fromJson(Map<String, dynamic> json1) {
    defaultAddress = json1.containsKey('defaultAddress')
        ? (json1['defaultAddress'] is String)
            ? Address.fromJson((json.decode(json1['defaultAddress'])))
            : Address.fromGraphJson((json1['defaultAddress']) ?? {})
        : null;
    address = json1.containsKey('addresses')
        ? (json1['addresses'] is String)
            ? Addresses.fromJson((json.decode(json1['addresses'])))
            : Addresses.fromGraphJson((json1['addresses']) ?? {})
        : null;
    // defaultAddress = Address.fromGraphJson(json1['defaultAddress'] ?? "");
    // address = Addresses.fromGraphJson(json1['addresses'] ?? {});
    createdAt = json1['createdAt'];
    displayName = json1['displayName'];
    email = json1['email'];
    firstName = json1['firstName'];
    id = json1['_id'];
    shopifyId = json1['id'];
    deviceId = json1['device_id'];
    deviceName = json1['device_name'];
    fcmToken = json1['fcm_token'];
    partnerId = json1['partner_id'];
    lastName = json1['lastName'];
    phone = json1['phone'];
    tags = json1.containsKey('tags') ? _getTagList(json1) : null;
    lastIncompleteCheckout = json1.containsKey('lastIncompleteCheckout')
        ? json1['lastIncompleteCheckout'] == null
            ? null
            : LastIncompleteCheckout.fromJson(
                json1['lastIncompleteCheckout'] ?? const {})
        : null;
    profileImage =
        json1.containsKey(('profileImage')) ? json1['profileImage'] : "";
  }

  Map<String, dynamic> toJson() => {
        'defaultAddress':
            defaultAddress != null ? defaultAddress!.toJson() : '{}',
        'address': address != null ? address!.toJson() : '{}',
        'createdAt': '$createdAt',
        'displayName': '$displayName',
        'email': '$email',
        'firstName': '$firstName',
        '_id': '$id',
        'device_id': '$deviceId',
        'device_name': '$deviceName',
        'fcm_token': '$fcmToken',
        'partner_id': '$partnerId',
        'id': '$shopifyId',
        'lastName': '$lastName',
        'phone': '$phone',
        'lastIncompleteCheckout': lastIncompleteCheckout != null
            ? lastIncompleteCheckout!.toJson()
            : null,
        'tags': tags != null ? tags!.toList() : [],
        'profileImage': profileImage != null ? '$profileImage' : ""
      };

  static List<String> _getTagList(Map<String, dynamic> json) {
    List<String> tagsList = [];
    if (json["tags"] == null) return tagsList;
    json['tags']?.forEach((tag) => tagsList.add(tag ?? {}));
    return tagsList;
  }
}
