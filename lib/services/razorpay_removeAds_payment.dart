import 'package:get/get.dart';
import 'package:new_love_calculator_2021/services/find_paid_user.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';
import 'package:new_love_calculator_2021/widgets/custom_screenshot_saved_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RemoveAds {
  // late Razorpay razorpay;

  void handlerPaymentSuccess(PaymentSuccessResponse response) async {
    // print('remove ads payment success');
    String paymentId = response.paymentId.toString();
    String orderId = response.orderId.toString();
    // String signature = response.signature.toString();
    FindPaidUser().writeisPaidUser(true);
    String title =
        "Payment Successful! Ads have been removed \n payment id - $paymentId \n order id - $orderId";
    CustomScreenshotSaved().screenshotSaved(() => Get.back(), title);
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    // print('remove ads payment failure');
    FindPaidUser().deleteUserPaidDetails();
    CustomScreenshotSaved()
        .screenshotSaved(() => Get.back(), UsableStrings.paymentFailed);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    // print('remove ads payment error');
    FindPaidUser().deleteUserPaidDetails();
    CustomScreenshotSaved()
        .screenshotSaved(() => Get.back(), UsableStrings.paymentFailed);
  }

  void openCheckout(Razorpay razorpay) {
    var options = {
      "key": "rzp_live_IutqO2YZ16K8b2",
      "amount": 25 * 100,
      "name": "anonymous",
      "description": "You are donating",
      "prefill": {"contact": "phonenumber", "email": "email"},
      "external": {
        "wallets": [
          "gpay",
          "paytm",
          "phonepe",
          "paypal",
        ]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      // print(e.toString());
    }
  }
}
