import 'package:flutter/foundation.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentService {
  PaymentService() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: "your_publishable_key_here",
        merchantId: "your_merchant_id_here",
        androidPayMode: 'test', // Change to 'production' for live payments
      ),
    );
  }

  Future<void> initPayment() async {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: "your_publishable_key_here",
        merchantId: "your_merchant_id_here",
        androidPayMode: 'test', // Change to 'production' for live payments
      ),
    );
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    try {
      PaymentMethod paymentMethod =
          await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest(),
      );
      return paymentMethod;
    } catch (e) {
      if (kDebugMode) {
        print("Error creating payment method: $e");
      }
      return null;
    }
  }

  Future<void> processPayment(
      {required String paymentIntentClientSecret,
      required PaymentMethod paymentMethod}) async {
    try {
      PaymentIntentResult paymentIntent =
          await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: paymentIntentClientSecret,
          paymentMethodId: paymentMethod.id,
        ),
      );

      if (paymentIntent.status == 'succeeded') {
        if (kDebugMode) {
          print("Payment succeeded");
        }
      } else {
        if (kDebugMode) {
          print("Payment failed");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error processing payment: $e");
      }
    }
  }
}
