import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:rms_mobile_xdk_flutter/rms_mobile_xdk_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Map<String, dynamic> paymentDetails = {};

  @override
  void initState() {
    super.initState();
    paymentDetails = {
      // Mandatory String. A value more than '1.00'
      "mp_amount": "1.10",

      // Mandatory String. Values obtained from MOLPay
      "mp_username": "",
      "mp_password": "",
      "mp_merchant_ID": "",
      "mp_app_name": "",
      "mp_verification_key": "",

      // Mandatory String. Payment values
      'mp_order_ID': '',
      "mp_currency": "MYR",
      "mp_country": "MY",

      "mp_channel": "",
      "mp_bill_description": "",
      "mp_bill_name": "",
      "mp_bill_email": "",
      "mp_bill_mobile": "",
    };
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('Payment XDK'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                            'Billing Information',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                      ),
                      Container(
                        child: Text(
                            '=======================================',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order ID',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            Text(
                              paymentDetails['mp_order_ID'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bill Name',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(paymentDetails['mp_bill_name'],
                              style: const TextStyle(fontSize: 16))
                        ],
                      )),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Country',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(paymentDetails['mp_country'],
                              style: const TextStyle(fontSize: 16))
                        ],
                      )),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Currency',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(paymentDetails['mp_currency'],
                              style: const TextStyle(fontSize: 16))
                        ],
                      )),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mobile',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          Text(paymentDetails['mp_bill_mobile'],
                              style: const TextStyle(fontSize: 16))
                        ],
                      )),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        Text(paymentDetails['mp_amount'],
                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,
                              color: Colors.black,))
                      ],
                    )),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      child: new ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.purple),
                        ),
                        child: const Text(
                          'Proceed to Payment',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          var result = MobileXDK.start(paymentDetails);
                          print("Result" + result.toString());
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
