
import 'payment_settings/payment_settings.dart';
import 'primary_domain/primary_domain.dart';
import 'privacy_policy/privacy_policy.dart';
import 'refund_policy/refund_policy.dart';
import 'shipping_policy/shipping_policy.dart';
import 'subscription_policy/subscription_policy.dart';
import 'terms_of_service/terms_of_service.dart';

class Shop {
  String? description;
  String? moneyFormat;
  String? name;
  PaymentSettings? paymentSettings;
  PrimaryDomain? primaryDomain;
  PrivacyPolicy? privacyPolicy;
  RefundPolicy? refundPolicy;
  ShippingPolicy? shippingPolicy;
  SubscriptionPolicy? subscriptionPolicy;
  List<String>? shipsToCountries;
  TermsOfService? termsOfService;

  Shop({
    this.description,
    this.moneyFormat,
    this.name,
    this.paymentSettings,
    this.primaryDomain,
    this.privacyPolicy,
    this.refundPolicy,
    this.shippingPolicy,
    this.subscriptionPolicy,
    this.shipsToCountries,
    this.termsOfService,
  });

  Shop.fromJson(Map<String, dynamic> json) {
    print(json);
    description = json['description'];
    moneyFormat = json['moneyFormat'];
    name = json['name'];
    paymentSettings = PaymentSettings.fromJson(json['paymentSettings']);
    primaryDomain = PrimaryDomain.fromJson(json['primaryDomain']);
    privacyPolicy = PrivacyPolicy.fromJson(json['privacyPolicy']??Map());
    refundPolicy = RefundPolicy.fromJson(json['refundPolicy']?? Map());
    shippingPolicy = ShippingPolicy.fromJson(json['shippingPolicy']??Map());
    subscriptionPolicy =
        SubscriptionPolicy.fromJson(json['subscriptionPolicy']??Map());
    shipsToCountries = _shipsToCountries(json);
    termsOfService = TermsOfService.fromJson(json['termsOfService']);
  }

 
  static List<String> _shipsToCountries(Map<String, dynamic> json) {
    List<String> shipsToCountries = [];
    if (json['node']?['shipsToCountries'] == null) return shipsToCountries;
    json['node']?['shipsToCountries']
        ?.forEach((e) => shipsToCountries.add(e ?? const {}));
    return shipsToCountries;
  }

  Map<String, dynamic> toJson() =>
      {
        'description': description,
        'name': name,
        'moneyFormat': moneyFormat,
        'paymentSettings': paymentSettings,
       // 'primaryDomain': primaryDomain,
        'privacyPolicy': privacyPolicy,
        'refundPolicy': refundPolicy,
        'shippingPolicy': shippingPolicy,
        'subscriptionPolicy': subscriptionPolicy,
        'termsOfService': termsOfService,
      };


}
