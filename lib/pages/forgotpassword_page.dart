import 'package:app_cuoiki/components/button/app_elevated_button.dart';
import 'package:app_cuoiki/components/text_field/app_text_field_password.dart';
import 'package:app_cuoiki/pages/login_page.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:app_cuoiki/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class FgPasswordPage extends StatefulWidget {
  const FgPasswordPage({super.key});

  @override
  State<FgPasswordPage> createState() => _FgPasswordPageState();
}

class _FgPasswordPageState extends State<FgPasswordPage> {
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  void initState() {
  super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 0),
              child: Form(
                key: formkey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              const Text(
                  'Quên mật khẩu',
                  style: TextStyle(color: AppColor.pink, 
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Tạo mật khẩu mới',
                  style: TextStyle(color: AppColor.grey, 
                  fontSize: 15.0,),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: AppColor.pink),
                  )
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Bạn chưa nhận được mã? ', style: TextStyle(color: Colors.grey, fontSize: 16.0)),
                   Text('Gửi lại', style: TextStyle(color: Colors.pink, fontSize: 16.0)),
                ],
              ),

                const SizedBox(height: 30.0),
                
                AppTextFieldPassword(
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    hintText: 'Mật khẩu',
                    validator: Validator.passwordValidator.call,
                  ),
                
                const SizedBox(height: 10.0),

                AppTextFieldPassword(
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    hintText: 'Nhập lại mật khẩu',
                    validator: (confirm) => Validator.confirmPasswordValidator(passwordController.text).call(confirm),
                  ),
                
                const SizedBox(height: 50.0),

                  Align(
                      alignment: Alignment.center,
                      child: AppElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        text: 'Hoàn tất',
                      ),
                    ),
              ],
            ),
          )
          ))),


    );
  
  }
}