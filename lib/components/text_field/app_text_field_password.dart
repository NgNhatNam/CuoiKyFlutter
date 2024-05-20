import 'package:app_cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppTextFieldPassword extends StatefulWidget {
  const AppTextFieldPassword({
    super.key,
    this.controller,
    this.onChanged,
    required this.hintText,
    this.textInputAction,
    this.validator,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hintText;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  @override
  State<AppTextFieldPassword> createState() => _AppTextFieldPasswordState();
}

class _AppTextFieldPasswordState extends State<AppTextFieldPassword> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0), 
      child: Container(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 58.0,
                decoration:  BoxDecoration(
                  color: AppColor.pink,//.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              child: TextFormField(
                textAlignVertical: const TextAlignVertical(y: 0.0),
                controller: widget.controller,
                onChanged: widget.onChanged,
                obscureText: !showPassword,
                
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 16.0),
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: AppColor.white),
                  prefixIcon: const Icon(Icons.password, color: AppColor.white),
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => showPassword = !showPassword),
                    child: Icon(
                      Icons.remove_red_eye_rounded,
                      color: showPassword ? AppColor.white : AppColor.green,
                    ),
                  ),
                ),
                textInputAction: widget.textInputAction,
                style: const TextStyle(color: AppColor.white, fontSize: 16.0),
                validator: widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
