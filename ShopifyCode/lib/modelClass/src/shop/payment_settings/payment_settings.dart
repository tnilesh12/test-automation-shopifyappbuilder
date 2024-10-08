

class PaymentSettings  {
  List<String>? acceptedCardBrands;
    String? cardVaultUrl;
    String? countryCode;
    String? currencyCode;
    List<String>? enabledPresentmentCurrencies;
    String? shopifyPaymentAccountId;
    List<String>? supportedDigitalWallets;
   PaymentSettings({
  this.acceptedCardBrands,
   this.cardVaultUrl,
   this.countryCode,
   this.currencyCode,
    this.enabledPresentmentCurrencies,
    this.shopifyPaymentAccountId,
   this.supportedDigitalWallets,
  }) ;

   PaymentSettings.fromJson(Map<String, dynamic> json)
   {
acceptedCardBrands=_getAcceptedCardBrands(json);
cardVaultUrl=json['cardVaultUrl'];
countryCode=json['countryCode'];
currencyCode=json['currencyCode'];
enabledPresentmentCurrencies=_getEnabledPresentmentCurrencies(json);
shopifyPaymentAccountId=json['shopifyPaymentAccountId'];
supportedDigitalWallets=_getSupportedDigitalWallets(json);
   }


Map<String,dynamic> toJson()=>
{
'acceptedCardBrands':'$_getAcceptedCardBrands',
'cardVaultUrl':'$cardVaultUrl',
'countryCode':'$countryCode',
'currencyCode':'$currencyCode',
'enabledPresentmentCurrencies':'$_getEnabledPresentmentCurrencies',
'supportedDigitalWallets':'$_getSupportedDigitalWallets(json)'
};



   static List<String> _getAcceptedCardBrands(Map<String, dynamic> json) {
    List<String> acceptedCardBrands = [];
    if (json['node']?['acceptedCardBrands'] == null) return acceptedCardBrands;
    json['node']?['acceptedCardBrands']?.forEach((e) => acceptedCardBrands.add(e ?? const {}));
    return acceptedCardBrands;
  }
  static List<String> _getEnabledPresentmentCurrencies(Map<String, dynamic> json) {
    List<String> enabledPresentmentCurrencies = [];
    if (json['node']?['enabledPresentmentCurrencies'] == null) return enabledPresentmentCurrencies;
    json['node']?['enabledPresentmentCurrencies']?.forEach((e) => enabledPresentmentCurrencies.add(e ?? const {}));
    return enabledPresentmentCurrencies;
  }
  static List<String> _getSupportedDigitalWallets(Map<String, dynamic> json) {
    List<String> supportedDigitalWallets = [];
    if (json['node']?['supportedDigitalWallets'] == null) return supportedDigitalWallets;
    json['node']?['supportedDigitalWallets']?.forEach((e) => supportedDigitalWallets.add(e ?? const {}));
    return supportedDigitalWallets;
  }
}
