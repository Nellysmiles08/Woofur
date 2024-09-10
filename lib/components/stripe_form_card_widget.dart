import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'stripe_form_card_model.dart';
export 'stripe_form_card_model.dart';

class StripeFormCardWidget extends StatefulWidget {
  const StripeFormCardWidget({
    super.key,
    required this.callback,
  });

  final Future Function(String? paymentMethodId, StripeCardStruct? cardDetails)?
      callback;

  @override
  State<StripeFormCardWidget> createState() => _StripeFormCardWidgetState();
}

class _StripeFormCardWidgetState extends State<StripeFormCardWidget> {
  late StripeFormCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripeFormCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.45,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AuthUserStreamWidget(
                builder: (context) => custom_widgets.StripeCardForm(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  name: currentUserDisplayName,
                  email: currentUserEmail,
                  callback: (paymentId, cardDetails) async {
                    await widget.callback?.call(
                      paymentId,
                      cardDetails,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
