import 'package:app_cuoiki/components/button/app_elevated_button.dart';
import 'package:app_cuoiki/components/text_field/app_text_field_password.dart';
import 'package:app_cuoiki/components/text_field/app_textfield.dart';
import 'package:app_cuoiki/pages/e_forgot_password_page.dart';
import 'package:app_cuoiki/pages/home_page.dart';
import 'package:app_cuoiki/pages/register_page.dart';
import 'package:app_cuoiki/resources/app_color.dart';
import 'package:app_cuoiki/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey();


  @override

  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
  Widget build(BuildContext context) {
     return GestureDetector(
      child: Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Form(
                key: formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Chào mừng',
                  style: TextStyle(color: AppColor.pink, 
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Đăng nhập tài khoản',
                  style: TextStyle(color: AppColor.grey, 
                  fontSize: 15.0,),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 50.0),
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
                    textInputAction: TextInputAction.done,
                    hintText: 'Mật khẩu',
                    validator: Validator.passwordValidator.call,
                  ),
                
                const SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return const RegisterPage();
                          }));
                        },
                        child: const Text(
                          'Đăng kí',
                          style: TextStyle(
                            color: AppColor.pink,
                            fontSize: 16.0,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Text(' | ', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return const EforgotPasswordPage();
                          }));
                        },
                        child: const Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                            color: AppColor.grey,
                            fontSize: 16.0,
                            //decoration: TextDecoration.underline,
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
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        text: 'Đăng nhập',
                      ),
                    ),
/*                   FractionallySizedBox(
                 widthFactor: 0.3,
                 
                  child: AppElevatedButton(
                    onPressed: () {
                      bool isChecked = emailController.text.trim().isNotEmpty &&
                          passwordController.text.isNotEmpty;
                      if(isChecked){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return const HomePage();}));
                      }
                      else{
                      return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('False'),
                              content:  const Text(
                                            'Please enter username and password',
                                            style: TextStyle(
                                                color: AppColor.pink, fontSize: 20.0),
                                            textAlign: TextAlign.center,
                                          ),
                              actions: <Widget>[
                                AppElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    height: 60.0,
                                    text: 'Ok')
                              ],
                            );
                          });
                    }
                    },
                    text: 'Sign In',
                    textColor: AppColor.pink,
                    color: AppColor.white,
                    borderColor: AppColor.pink,
                  ),
                ), */
              ],
            ),
          )
          ))),
    ));

  }
}