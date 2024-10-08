import 'package:shopify_code/app_config/app_config.dart';

class ApiConst {
  static String baseUrl = "${AppConfig.BASE_URL}external/";

  static String partnerlogin = "${AppConfig.BASE_URL}public/partner-login";
  // static String partnerlogin2 = "partner-login?shop=${AppConfig.APP_DOMAIN}";
  static String getCustomerList =
      "partner/user-list?shop=${AppConfig.APP_DOMAIN}";

  static String getThemeList =
      "design/default-themes?shop=${AppConfig.APP_DOMAIN}";

  // static String designUrl = "design?shop=${AppConfig.APP_DOMAIN}";
  // static String getStyle = "design?page_type=Style&shop=${AppConfig.APP_DOMAIN}";
  // static String getMenu = "design?page_type=Menu&shop=${AppConfig.APP_DOMAIN}";
  // static String getDashboard = "design?page_type=Dashboard&shop=${AppConfig.APP_DOMAIN}";

  static String getStyle =
      "design/app-publish?shop=${AppConfig.APP_DOMAIN}&theme={theme_name}&page_type=Style&isPublish={is_published}";
  static String getMenu =
      "design/app-publish?shop=${AppConfig.APP_DOMAIN}&theme={theme_name}&page_type=Menu&isPublish={is_published}";
  static String getDashboard =
      "design/app-publish?shop=${AppConfig.APP_DOMAIN}&theme={theme_name}&page_type=Dashboard&isPublish={is_published}";
  static String getCollectionFromDesign =
      "design/app-publish?shop=${AppConfig.APP_DOMAIN}&theme={theme_name}&page_type=Collection&isPublish={is_published}";
  // static  String settingsUrl = "partner/settings?shop=${AppConfig.APP_DOMAIN}";
  static String getPartnerInfo = "partner/info?shop=${AppConfig.APP_DOMAIN}";
  static String addCustomer = "customer/add?shop=${AppConfig.APP_DOMAIN}";

  static String registerCustomer = "customer/{id}?shop=${AppConfig.APP_DOMAIN}";
  static String loginCustomer = "auth/login?shop=${AppConfig.APP_DOMAIN}";
  static String forgotPasswordCustomer =
      "auth/forgot-password/?shop=${AppConfig.APP_DOMAIN}&email={email}";

  // static  String getDataApi = 'dashboard/customer-list';
  static String shopContactUsInfo = 'contact/info?shop=${AppConfig.APP_DOMAIN}';
  static String shopContactUsSubmitInfo =
      'customer/support?shop=${AppConfig.APP_DOMAIN}';
  static String chatUrl = AppConfig.BASE_URL;
  static String chatUrlShopifyInbox =
      "${AppConfig.BASE_URL}public/shopify-inbox?partner_id={partner_id}&shop=${AppConfig.APP_DOMAIN}";

  static String changePassword =
      "auth/reset-password/?shop=${AppConfig.APP_DOMAIN}&accessToken={accesstoken}";
  static String myProfileApi =
      "customer/update-details/{id}?shop=${AppConfig.APP_DOMAIN}&accessToken={accesstoken}";
  static String imageApi = "file/upload/?shop=${AppConfig.APP_DOMAIN}";
  static String profileImageApi =
      "${AppConfig.BASE_URL}public/profile/customer/{id}?width=500&height=500";

  static String getCustomerById =
      "customer/info/{id}?shop=${AppConfig.APP_DOMAIN}";
  static String orderListApi =
      "customer/order/list?shop=${AppConfig.APP_DOMAIN}&accessToken={accessToken}";

  // static  String getProductByCollectionId = "products/collection/408508104947?shop=itg-app.myshopify.com";
  static String predictiveSearch =
      "products/predictive?shop=${AppConfig.APP_DOMAIN}";
  static String getProductById = "products/{id}?shop=${AppConfig.APP_DOMAIN}";
  static String getProductByHandle =
      "products/handle/details?shop=${AppConfig.APP_DOMAIN}&productHandle={product_handle}";
  static String getRelatedProductsList =
      "customer/products/related?shop=${AppConfig.APP_DOMAIN}";

  static String getProductListByHandle =
      "products/collections/handle-data?shop=${AppConfig.APP_DOMAIN}";

  static String createCart =
      "cart/add?shop=${AppConfig.APP_DOMAIN}&accessToken={accessToken}";
  static String addToCart =
      "cart/add/cart-items?id={id}&shop=${AppConfig.APP_DOMAIN}&accessToken={accessToken}";
  static String getCartDetailsById =
      "cart/details?id={id}&shop=${AppConfig.APP_DOMAIN}&accessToken={accessToken}";
  static String updateCartVariantQuantity =
      "cart/variant-quantity?shop=${AppConfig.APP_DOMAIN}&id={id}&accessToken={accessToken}";
  static String removeCartItem =
      "cart/remove-items?shop=${AppConfig.APP_DOMAIN}&id={id}&accessToken={accessToken}";

  static String getCollectionList =
      "collection/all-list/?shop=${AppConfig.APP_DOMAIN}";
  static String getCollectionMenuHandle =
      "menu/items/list?shop=${AppConfig.APP_DOMAIN}";
  // static String getCollectionListLive =
  //     "collection/list/?shop=${AppConfig.APP_DOMAIN}";

  static String addressDeleteApi =
      "customer/address/single-address?shop=${AppConfig.APP_DOMAIN}&accessToken={accesstoken}";
  static String addressListUrl =
      "customer/address/list?shop=${AppConfig.APP_DOMAIN}&accessToken={accessToken}";

  static String updateAddressApi =
      "customer/address/single-address?shop=${AppConfig.APP_DOMAIN}&accessToken={accesstoken}";
  static String addAddressApi =
      "customer/address/add?shop=${AppConfig.APP_DOMAIN}&accessToken={accesstoken}";
  // "customer/address/list?shop=${AppConfig.APP_DOMAIN}&accessToken=e284f1d719e093b7d8dc8450a7392f02";

  static String addToFavorite =
      "customer/favorite/add?shop=${AppConfig.APP_DOMAIN}";
  static String removeFromFavorite =
      "customer/favorite/remove?shop=${AppConfig.APP_DOMAIN}";
  static String getFavoriteList =
      "customer/favorite/list?shop=${AppConfig.APP_DOMAIN}";

  static String zipCodeUrl =
      "https://api.zipcodestack.com/v1/search?codes={zipCode}&country={countryCode}";
  static String countryCode =
      "customer/shopify/countries-details/list?shop=${AppConfig.APP_DOMAIN}";
  static String stateCode =
      "/customer/shopify/countries-details/{countryId}?shop=${AppConfig.APP_DOMAIN}";
  static String getShopPolicies = "shop/policies?shop=${AppConfig.APP_DOMAIN}";
  static String getAppStatus =
      "${AppConfig.BASE_URL}public/admin/app-status/{partner_id}";

  static String notificationlist =
      "notifications/list?shop=${AppConfig.APP_DOMAIN}";

  static String getProductList =
      "products/collection/{c_id}?shop=${AppConfig.APP_DOMAIN}";
  static String productFilterByCollectionHandle =
      "customer/products/collection-handel?shop=${AppConfig.APP_DOMAIN}";

  static String getProductReviewCount =
      "plugins/reviews/count/product/{p_id}?shop=${AppConfig.APP_DOMAIN}";
  static String createRatingReview =
      "plugins/reviews/create?shop=${AppConfig.APP_DOMAIN}";
  static String productReviewList =
      "plugins/reviews/product/{p_id}?shop=${AppConfig.APP_DOMAIN}";

  static String getFormById =
      "design/form/{form_id}?shop=${AppConfig.APP_DOMAIN}";
  static String submitForm =
      "design/form/ans/add/?shop=${AppConfig.APP_DOMAIN}";

  static String getShopifyUser =
      "customer/shopify/info?shop=${AppConfig.APP_DOMAIN}&accessToken={accessToken}";

  static String checkoutDiscountCodeRemove =
      "cart/discount-code?shop=${AppConfig.APP_DOMAIN}&id={cart_id}";
  static String checkoutDiscountCodeApply =
      "cart/discount-code?shop=${AppConfig.APP_DOMAIN}&id={cart_id}";
  static String updateShippingAddress =
      "cart/customer-details?shop=${AppConfig.APP_DOMAIN}";
  // static  String createCheckout= "";
  static String updateCartCustomerNote =
      "cart/note?shop=${AppConfig.APP_DOMAIN}&id={cart_id}";

  static String getInstaFeed =
      "plugins/instagram/feeds?shop=${AppConfig.APP_DOMAIN}";
  static String whatsappApi =
      "plugins/reviews/whatsapp/send-message?shop=${AppConfig.APP_DOMAIN}";
  static String boostAISearch =
      "https://services.mybcapps.com/bc-sf-filter/search/suggest?event_type=search&page=10&sort=['title-ascending']&q={query}&page_limit=10&collection_limit=10&product_limit=10&suggestion_limit=10&shop=${AppConfig.APP_DOMAIN}";

  static String blogByHandle =
      'design/blogs/handle/?shop=${AppConfig.APP_DOMAIN}';
  static String blogById =
      'design/blogs/?shop=${AppConfig.APP_DOMAIN}&blogId={blog_id}';
  static String articleById =
      'design/article/?shop=${AppConfig.APP_DOMAIN}&articleId={article_id}';

  static String pageByHandle =
      'design/pages/handle?shop=${AppConfig.APP_DOMAIN}';
  static String pageById =
      '/design/pages?id={page_id}&shop=${AppConfig.APP_DOMAIN}';

  static String getSizeChart =
      "https://app.kiwisizing.com/size?shop=${AppConfig.APP_DOMAIN}&product={p_id}&source=testing_only";

//automatic notification
  static String welcomeNotification =
      "notifications/automatic-notification/list?shop=${AppConfig.APP_DOMAIN}";
  static String customPage = "design/page/{id}/?shop=${AppConfig.APP_DOMAIN}";
  static String hulkProductOption =
      "https://productoption.hulkapps.com/v1/products/?product_id={id}&shop_domain=itgeeks-mobilify.myshopify.com&customer_tags={customer_tags}&product_collections={product_collections}&tags={tags}&vendor={vendor}&ptype={ptype}";

  static String getSmileIoCustomerByEmailData =
      "https://api.smile.io/v1/customers?email={email}";
  static String getSmileIoCustomerByIdData =
      "https://api.smile.io/v1/customers/{customer_id}?include=next_vip_tier.image_svg%2Cvip_tier.image_svg";
  static String getSmileIoWaysToRedeem =
      "https://api.smile.io/v1/points_products/";
  static String getSmileIoYourRewards =
      "https://api.smile.io/v1/reward_fulfillments?customer_id={customer_id}&is_transient=false&page=1&page_size={page_size}&with_customer=true";
  static String getSmileIoYourActivity =
      "https://api.smile.io/v1/points_transactions?customer_id={customer_id}";
  static String getSmileIoRedeemPoints =
      "https://api.smile.io/v1/points_products/{points_products_id}/purchase";

  static String getLoyaltyLionCustomerByEmailData =
      "https://api.loyaltylion.com/v2/customers?created_at_min=2018-01-01&email={email}";
  // static String getLoyaltyLionCustomerByIdData =
  //     "https://api.smile.io/v1/customers/{customer_id}?include=next_vip_tier.image_svg%2Cvip_tier.image_svg";
  static String getLoyaltyLionWaysToEarnPoints =
      "https://api.loyaltylion.com/v2/customers/{merchant_id}/available_rewards";
  // static String getLoyaltyLionYourRewards =
  //     "https://api.smile.io/v1/reward_fulfillments?customer_id={customer_id}&is_transient=false&page=1&page_size={page_size}&with_customer=true";
  static String getLoyaltyLionYourActivity =
      "https://api.loyaltylion.com/v2/customers/{merchant_id}/transactions";
  static String getLoyaltyLionRedeemPoints =
      "https://api.loyaltylion.com/v2/customers/{merchant_id}/claimed_rewards";

  static String emailSubscription =
      "plugins/mail-kl/subscription?shop=${AppConfig.APP_DOMAIN}";

  static String rebuyProduct =
      "https://rebuyengine.com/api/v1/products/{type}?key={api_key}&format=prettyy";

  static String recentOrderApi =
      "customer/recent-order-details?customerId={id}&shop=${AppConfig.APP_DOMAIN}";

  static const String submitQuiz =
      "https://api.quizkitapp.com/api/v1/quizzes/1jVH02ZYrq?presentment_currencies=USD&countryCode=US";

  static const String startQuiz =
      "https://api.quizkitapp.com/api/v1/quizzes/1jVH02ZYrq";

  static String tevelloUrl =
      // "${AppConfig.BASE_URL}a/members?customerId={customer_id}&shop=${AppConfig.APP_DOMAIN}";
      "${AppConfig.BASE_URL}a/members?customerId={customer_id}&shop=onleorgaincs.com";
  static String tevelloEndUrl =
      "customerId={customer_id}&shop=${AppConfig.APP_DOMAIN}";

  static String looxReviewFirst =
      "${AppConfig.BASE_URL}public/loox_review_first?data-id={product_id}&shop=${AppConfig.APP_DOMAIN}";
  static String looxAddReview =
      "${AppConfig.BASE_URL}public/loox_review_second?data-id={product_id}&shop=${AppConfig.APP_DOMAIN}";
  static String looxAllReview =
      "${AppConfig.BASE_URL}public/loox_review_third?data-id={product_id}&shop=${AppConfig.APP_DOMAIN}#loox-review";

  static String okendoAddReview =
      "https://okendo.reviews/?subscriberId={subscriber_id}&productId=shopify-{product_id}&locale=en";
  // ${AppConfig.BASE_URL}public/Okendo_review_first?product-id={product_id}&subscriberId={subscriber_id}";
  static String okendoReviewSecond =
      "${AppConfig.BASE_URL}public/Okendo_review_second?subscriberId={subscriber_id}";
  static String okendoReviewThird =
      "${AppConfig.BASE_URL}public/Okendo_review_third?product-id=shopify-{product_id}&subscriberId={subscriber_id}";
  static String specification =
      "products/meta-fields/{id}?shop=${AppConfig.APP_DOMAIN}";
      
  static String mediaImageById =
      'customer/medial-image/{media_image_id}?shop=${AppConfig.APP_DOMAIN}';
}
