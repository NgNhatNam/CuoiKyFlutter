import 'package:app_cuoiki/components/button/app_elevated_button.dart';
import 'package:app_cuoiki/components/text_field/app_text_field_password.dart';
import 'package:app_cuoiki/pages/login_page.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:app_cuoiki/utils/validator.dart';
import 'package:flutter/material.dart';

class FgPasswordPage extends StatefulWidget {
  const FgPasswordPage({super.key});

  @override
  State<FgPasswordPage> createState() => _FgPasswordPageState();
}

class _FgPasswordPageState extends State<FgPasswordPage> {
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
         return Scaffold(
      appBar: AppBar(
        title: const Text('Quên mật khẩu',
        style: TextStyle(),),
        
      ),
body: Center(
        child: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Form(
                key: formkey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Quên mật khẩu',
                  style: TextStyle(color: AppColor.pink, fontSize: 24.0),
                  textAlign: TextAlign.center,
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
                
                const SizedBox(height: 10.0),

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
                        text: 'Đăng nhập',
                      ),
                    ),
              ],
            ),
          )
          ))),


    );
  
  }
}