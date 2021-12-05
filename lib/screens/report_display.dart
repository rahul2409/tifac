import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tifac/models/create_order_id.dart';
import 'package:tifac/models/reportmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tifac/services/shared_preferences.dart';

class ReportPage extends StatefulWidget {
  final Report report;

  const ReportPage({Key? key, required this.report}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late Razorpay _razorpay;
  String userID = "";
  String mobile = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Details'),
        foregroundColor: const Color.fromRGBO(219, 115, 14, 1),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Price of the report - Rs.${widget.report.price}'),
              MaterialButton(
                child: const Text(
                  'Purchase',
                  style: TextStyle(color: Colors.white),
                ),
                color: const Color.fromRGBO(5, 0, 154, 1),
                onPressed: openCheckout,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TIFAC_Mobile_Application/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        height: height,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                widget.report.reportname,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.network(
                widget.report.reportimagepath,
                width: width,
                height: height / 3.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Year Of Publishing',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(widget.report.yearofpublication),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Category Of Report',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(widget.report.category),
                ],
              ),
            ),
            ExpansionTile(
              title: const Text('Excerpt'),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(widget.report.excerpt),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobile = UserSharedPreferences.getUsername()!;
    userID = UserSharedPreferences.getUsername()!;
    email = UserSharedPreferences.getEmail()!;
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  Future<http.Response> createOrderId(String userID, String reportID) {
    return http.get(
      Uri.parse(
          "https://tifac.wipurl.com/index.php/orderid/${userID}/${reportID}"),
    );
  }

  late String orderId = "";
  void openCheckout() async {
    print('$mobile - mobile number and email id is - $email');

    // Generate order id.
    http.Response response =
        await createOrderId(userID, widget.report.reportid);
    print(response.toString());
    if (response.statusCode == 200) {
      final responseBody = response.body;
      print(responseBody);
      var orderIdFromResponse = jsonDecode(responseBody);
      print(
          "${orderIdFromResponse["success"]} and the orderid is ${orderIdFromResponse["orderid"]}");
      orderId = orderIdFromResponse["orderid"];
    }

    // Passed the generated order id in the function.
    var options = {
      'key': 'rzp_test_L2FaKIIvbKIEaU',
      'amount': num.parse(widget.report.price) * 100,
      'name': 'TIFAC',
      'description': widget.report.reportname,
      'retry': {'enabled': true, 'max_count': 2},
      'send_sms_hash': true,
      'prefill': {'contact': mobile, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: e');
    }
  }

  Future<bool> updateOrderId(String? paymentId, String orderId) async {
    var apiUrl = "https://tifac.wipurl.com/index.php/updateorder";
    Map updatedOrder = {
      "orderid": orderId,
      "paymentid": paymentId,
    };
    print(jsonEncode(updatedOrder));
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(updatedOrder),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.toString());
      final responseBody = response.body;
      print(responseBody);
      var updatedOrderFromResponse = jsonDecode(responseBody);
      print(
          "${updatedOrderFromResponse["success"]} and the order id is ${updatedOrderFromResponse["orderid"]}");
      if (updatedOrderFromResponse["success"] == 1) {
        return true;
      }
    }
    return false;
  }

  void _handlePaymentSuccess(
      PaymentSuccessResponse paymentSuccessResponse) async {
    // Once the response is delivered change the orderdetails

    bool response =
        await updateOrderId(paymentSuccessResponse.paymentId!, orderId);
    if (response) {
      Fluttertoast.showToast(
          msg: "SUCCESS:  ${paymentSuccessResponse.paymentId!} and ${orderId}.",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(
          msg:
              "Failed updation:  ${paymentSuccessResponse.paymentId!} and ${orderId}.",
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: Could not complete the payment.",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
