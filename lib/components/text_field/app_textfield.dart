import 'package:app_cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.textInputAction,
    this.validator,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final Icon? prefixIcon;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final bool readOnly;

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
                decoration: BoxDecoration(
                  color: AppColor.pink,//.withOpacity(0.32),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              child: TextFormField(
                textAlignVertical: const TextAlignVertical(y: 0.0),
                controller: controller,
                readOnly: readOnly,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 16.0),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(color: AppColor.white),
                  prefixIcon: prefixIcon,
                ),
                textInputAction: textInputAction,
                style: const TextStyle(color: AppColor.white, fontSize: 16.0),
                validator: validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
