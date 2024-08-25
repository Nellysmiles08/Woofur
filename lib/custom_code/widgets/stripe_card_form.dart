// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_stripe/flutter_stripe.dart';

class StripeCardForm extends StatefulWidget {
  const StripeCardForm({
    super.key,
    this.width,
    this.height,
    this.name,
    required this.email,
    required this.callback,
  });

  final double? width;
  final double? height;
  final String? name;
  final String email;
  final Future Function(String paymentId, StripeCardStruct cardDetails)
      callback;

  @override
  State<StripeCardForm> createState() => _StripeCardFormState();
}

class _StripeCardFormState extends State<StripeCardForm> {
  late CardFormEditController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = CardFormEditController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CardFormField(
          controller: controller,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Cancel'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey,
              )),
              onPressed: () => Navigator.of(context).pop(),
            ),
            !isLoading
                ? ElevatedButton(
                    onPressed: controller.details.complete
                        ? () async {
                            setState(() {
                              isLoading = true;
                            });
                            final paymentMethod =
                                await Stripe.instance.createPaymentMethod(
                              params: PaymentMethodParams.card(
                                paymentMethodData: PaymentMethodData(
                                  billingDetails: BillingDetails(
                                    name: widget.name,
                                    email: widget.email,
                                  ),
                                ),
                              ),
                            );
                            final cardDetails = StripeCardStruct(
                              brand: paymentMethod.card.brand,
                              country: paymentMethod.card.country,
                              expMonth: paymentMethod.card.expMonth,
                              expYear: paymentMethod.card.expYear,
                              funding: paymentMethod.card.funding,
                              last4: paymentMethod.card.last4,
                              type: paymentMethod.paymentMethodType,
                              name: paymentMethod.billingDetails.name,
                              city: paymentMethod.billingDetails.address?.city,
                              state:
                                  paymentMethod.billingDetails.address?.state,
                              zipCode: paymentMethod
                                  .billingDetails.address?.postalCode,
                              address: paymentMethod
                                      .billingDetails.address?.line1 ??
                                  paymentMethod.billingDetails.address?.line2,
                            );
                            await widget.callback(
                                paymentMethod.id, cardDetails);
                            setState(() {
                              isLoading = false;
                            });
                            if (mounted) {
                              context.pop();
                            }
                          }
                        : () {},
                    child: const Text("Add details"),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
