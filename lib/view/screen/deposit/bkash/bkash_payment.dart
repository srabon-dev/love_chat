import 'package:chat_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BkashPaymentScreen extends StatefulWidget {
  const BkashPaymentScreen({Key? key}) : super(key: key);

  @override
  State<BkashPaymentScreen> createState() => _BkashPaymentScreenState();
}

class _BkashPaymentScreenState extends State<BkashPaymentScreen> {
  String url = '';
  @override
  void initState() {
    super.initState();
    url = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: true,
        title: const Text(
          "Bkash Payment",
        ),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(url),
          ),
      ),
    );
  }
}
