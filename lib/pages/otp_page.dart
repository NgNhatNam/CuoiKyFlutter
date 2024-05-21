import 'package:app_cuoiki/components/button/app_elevated_button.dart';
import 'package:app_cuoiki/pages/login_page.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class SendCode extends StatefulWidget {
  const SendCode({super.key});

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
    final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: AppColor.white,
      ),
    decoration: BoxDecoration(
      color: AppColor.pink,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: AppColor.transparent)
      )
    ); 
 
    void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      child: Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            children: [
              const Text(
                "Đăng kí",
                style: TextStyle(
                  color: AppColor.pink,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
        
              ),        
              const Text('Nhập mã xác minh', 
              style: TextStyle(fontSize: 15, color: AppColor.grey)),
              const SizedBox(height: 20),
               Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: AppColor.pink),
                  
                  )
                ),
              ),
              const SizedBox(height: 30.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Bạn chưa nhận được mã? ', style: TextStyle(color: Colors.grey, fontSize: 16.0)),
                   Text('Gửi lại', style: TextStyle(color: Colors.pink, fontSize: 16.0)),
                ],
              ),
        
              const SizedBox(height: 50.0),
              Align(
                alignment: Alignment.center,
                child: AppElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginPage();
                    }));
                  },
                text: 'Tiếp tục',
                ),
              ),
          
            ],
          ),
))),
    ));
  }
}