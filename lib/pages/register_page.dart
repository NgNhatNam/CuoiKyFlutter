import 'package:app_cuoiki/components/button/app_elevated_button.dart';
import 'package:app_cuoiki/components/text_field/app_text_field_password.dart';
import 'package:app_cuoiki/components/text_field/app_textfield.dart';
import 'package:app_cuoiki/pages/login_page.dart';
import 'package:app_cuoiki/pages/otp_page.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:app_cuoiki/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
      backgroundColor: AppColor.white,
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
                  'Đăng kí',
                  style: TextStyle(color: AppColor.pink, fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Tạo tài khoản mới',
                  style: TextStyle(color: AppColor.grey, 
                  fontSize: 15.0,),
                  textAlign: TextAlign.center,
                ),
               const SizedBox(height: 30.0),

                AppTextField(
                    controller: userController,
                    textInputAction: TextInputAction.next,
                    hintText: "User name",
                    prefixIcon: const Icon(Icons.person_2, color: AppColor.white),
                    validator: Validator.requiredValidator.call,
                  ),
                const SizedBox(height: 10.0),
                AppTextField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email, color: AppColor.white),
                    validator: Validator.emailValidator.call,
                  ),
                const SizedBox(height: 10.0),
                
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
                
                const SizedBox(height: 20.0),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                       Text('Bạn đã có tài khoản? ', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16.0)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return const LoginPage();
                          }));
                        },
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: AppColor.pink,
                            fontSize: 16.0
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  Align(
                      alignment: Alignment.center,
                      child: AppElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const SendCode(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        text: 'Đăng kí',
                      ),
                    ),
              ],
            ),
          )
          ))),
    ));
  
  }
}