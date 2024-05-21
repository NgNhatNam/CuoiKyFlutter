import 'package:app_cuoiki/components/button/app_elevated_button.dart';
import 'package:app_cuoiki/components/text_field/app_textfield.dart';
import 'package:app_cuoiki/pages/forgotpassword_page.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:app_cuoiki/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EforgotPasswordPage extends StatefulWidget {
  const EforgotPasswordPage({super.key});

  @override
  State<EforgotPasswordPage> createState() => _EforgotPasswordPageState();
}

class _EforgotPasswordPageState extends State<EforgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
      body: Align(
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
                    style: TextStyle(color: AppColor.pink, fontSize: 24.0,
                     fontWeight:FontWeight.bold ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                    const Text(
                    'Nhập email của bạn',
                    style: TextStyle(
                      color: AppColor.grey, 
                      fontSize: 15.0,),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40.0),

                      AppTextField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email, color: AppColor.white),
                      validator: Validator.emailValidator.call,
                  ),

                  const SizedBox(height: 20.0),

                  Align(
                      alignment: Alignment.center,
                      child: AppElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const FgPasswordPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        text: 'Tiếp tục',
                      ),
                    ),
                    ],
                  )
              )
      )
    ))));
  }
}