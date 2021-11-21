import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
  @override
  late Razorpay _razorpay;
  String mobile = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.report.reportname),
        backgroundColor: const Color.fromRGBO(5, 0, 154, 1),
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
        height: height,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                widget.report.reportname,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(
                widget.report.reportimagepath,
                width: width,
                height: height / 3,
              ),
            ),
            ListTile(
              title: const Text('Year Of Publishing '),
              trailing: Text(widget.report.yearofpublication),
            ),
            ListTile(
              title: const Text('Category Of Report'),
              trailing: Text(widget.report.category),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionTile(
                title: const Text('Excerpt'),
                children: [
                  Text(widget.report.excerpt),
                ],
              ),
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

  void openCheckout() async {
    print('$mobile - mobile number and email id is - $email');
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
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
