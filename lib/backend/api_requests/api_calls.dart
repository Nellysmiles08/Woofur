import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Stripe Api Group Code

class StripeApiGroup {
  static String getBaseUrl({
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) =>
      'https://api.stripe.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [secretKey]',
  };
  static CreateCustomerCall createCustomerCall = CreateCustomerCall();
  static AddPaymentMethodToCustomerCall addPaymentMethodToCustomerCall =
      AddPaymentMethodToCustomerCall();
  static CreateConnectedAccountCall createConnectedAccountCall =
      CreateConnectedAccountCall();
  static CreateAccountLinkCall createAccountLinkCall = CreateAccountLinkCall();
  static MakePaymentCall makePaymentCall = MakePaymentCall();
  static GetCardsCall getCardsCall = GetCardsCall();
  static CreateEphemeralKeyCall createEphemeralKeyCall =
      CreateEphemeralKeyCall();
  static CreatePaymentIntentWithSplitCall createPaymentIntentWithSplitCall =
      CreatePaymentIntentWithSplitCall();
  static RetrieveAccountInfoCall retrieveAccountInfoCall =
      RetrieveAccountInfoCall();
  static SetPaymentMethodDefaultCall setPaymentMethodDefaultCall =
      SetPaymentMethodDefaultCall();
  static ConfirmPaymentCall confirmPaymentCall = ConfirmPaymentCall();
  static CreateSubscriptionCall createSubscriptionCall =
      CreateSubscriptionCall();
  static CancelSubscriptionCall cancelSubscriptionCall =
      CancelSubscriptionCall();
  static CheckPaymentCall checkPaymentCall = CheckPaymentCall();
  static TransferFundToConnectedAccountCall transferFundToConnectedAccountCall =
      TransferFundToConnectedAccountCall();
  static RetrieveTransferCall retrieveTransferCall = RetrieveTransferCall();
}

class CreateCustomerCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'create customer',
      apiUrl: '$baseUrl/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'name': name,
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.error.message''',
      );
}

class AddPaymentMethodToCustomerCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? paymentMethod = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'add payment method to customer',
      apiUrl: '$baseUrl/payment_methods/$paymentMethod/attach',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'customer': customer,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
}

class CreateConnectedAccountCall {
  Future<ApiCallResponse> call({
    String? country = '',
    String? email = '',
    String? type = 'standard',
    String? businessType = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'create connected account',
      apiUrl: '$baseUrl/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'country': country,
        'email': email,
        'business_type': businessType,
        'type': type,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class CreateAccountLinkCall {
  Future<ApiCallResponse> call({
    String? account = '',
    String? returnUrl = '',
    String? refreshUrl = '',
    String? type = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'create account link',
      apiUrl: '$baseUrl/account_links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'account': account,
        'refresh_url': refreshUrl,
        'return_url': returnUrl,
        'type': type,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
  dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class MakePaymentCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? customer = '',
    String? currency = 'USD',
    String? paymentMethod = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'make payment',
      apiUrl: '$baseUrl/payment_intents',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'customer': customer,
        'amount': amount,
        'currency': currency,
        'payment_method': paymentMethod,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GetCardsCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get cards',
      apiUrl: '$baseUrl/customer/$customer/cards',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'customer': customer,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateEphemeralKeyCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'create ephemeral key',
      apiUrl: '$baseUrl/ephemeral_keys',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Stripe-Version': '2024-04-10',
      },
      params: {
        'customer': customer,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatePaymentIntentWithSplitCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    int? amount,
    String? currency = 'USD',
    bool? automaticPaymentMethod = true,
    String? applicationFeeAmount = '',
    String? connectedAccount = '',
    String? paymentMethod = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'create payment intent with split',
      apiUrl: '$baseUrl/payment_intents',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'customer': customer,
        'amount': amount,
        'currency': currency,
        'automatic_payment_methods[enabled]': automaticPaymentMethod,
        'application_fee_amount': applicationFeeAmount,
        'transfer_data[destination]': connectedAccount,
        'payment_method': paymentMethod,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.error.message''',
      );
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class RetrieveAccountInfoCall {
  Future<ApiCallResponse> call({
    String? accountID = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve account info',
      apiUrl: '$baseUrl/accounts/$accountID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? chargesEnabled(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.charges_enabled''',
      ));
  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.error.message''',
      );
}

class SetPaymentMethodDefaultCall {
  Future<ApiCallResponse> call({
    String? customerID = '',
    String? paymentMethodID = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'set payment method default',
      apiUrl: '$baseUrl/customers/$customerID',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'invoice_settings[default_payment_method]': paymentMethodID,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic errorMessage(dynamic response) => getJsonField(
        response,
        r'''$.error.message''',
      );
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class ConfirmPaymentCall {
  Future<ApiCallResponse> call({
    String? returnUrl = '',
    String? paymentMethodID = '',
    String? paymentIntent = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'confirm payment',
      apiUrl: '$baseUrl/payment_intents/$paymentIntent/confirm',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'return_url': returnUrl,
        'payment_method': paymentMethodID,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.next_action.redirect_to_url.url''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class CreateSubscriptionCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    int? amount,
    String? connectedAccount = '',
    int? applicationFeePercent,
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'create subscription',
      apiUrl: '$baseUrl/subscriptions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'customer': customer,
        'items[0][price]': amount,
        'transfer_data[destination]': connectedAccount,
        'application_fee_percent': applicationFeePercent,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelSubscriptionCall {
  Future<ApiCallResponse> call({
    String? subscriptionID = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'cancel subscription',
      apiUrl: '$baseUrl/subscriptions/$subscriptionID',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckPaymentCall {
  Future<ApiCallResponse> call({
    String? paymentID = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'check payment',
      apiUrl: '$baseUrl/payment_intents/$paymentID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class TransferFundToConnectedAccountCall {
  Future<ApiCallResponse> call({
    int? amount,
    String? connectedAccount = '',
    String? currency = '',
    String? transferGroup = '',
    String? description = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'transfer fund to connected account',
      apiUrl: '$baseUrl/transfers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {
        'amount': amount,
        'currency': currency,
        'destination': connectedAccount,
        'transfer_group': transferGroup,
        'description': description,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RetrieveTransferCall {
  Future<ApiCallResponse> call({
    String? transferID = '',
    String? publicKey =
        'pk_test_51PCm8N02xOhf3tOd627qf48d8EX3XcTLdEd3MVX9LbkefdanQb7Po1bdcEca1z7TkEa9d7PZqThCfOXQnPD0oXHO00uonju6Hm',
    String? secretKey =
        'sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW',
  }) async {
    final baseUrl = StripeApiGroup.getBaseUrl(
      publicKey: publicKey,
      secretKey: secretKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'retrieve transfer',
      apiUrl: '$baseUrl/transfers/$transferID',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $secretKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Stripe Api Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
