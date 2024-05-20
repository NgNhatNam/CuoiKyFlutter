import 'package:app_cuoiki/resources/app_color.dart';
import 'package:flutter/material.dart';

class SendCode extends StatefulWidget {
  const SendCode({super.key});

  @override
  State<SendCode> createState() => _SendCodeState();
}

class _SendCodeState extends State<SendCode> {
    TextEditingController codeController = TextEditingController();

    final focusNodes = List.generate(4, (index) => FocusNode());
  @override
  Widget build(BuildContext context) {
     // Sử dụng Hook để quản lý trạng thái mã xác thực
  

    // Hàm xử lý khi người dùng nhấn nút "Next"
    void handleSubmit() {
      final code = codeController.text;
      if (code.length == 4) {
        // Xử lý logic xác thực mã ở đây
        print("Entered code: $code");
      } else {
        // Hiển thị thông báo lỗi nếu mã không đủ 4 ký tự
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a 4-digit code')));
      }
    }

    // Hàm để gửi lại mã xác thực
    void resendCode() {
      // Thực hiện logic gửi lại mã ở đây
      print("Resend code");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter Verification Code', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 50,
                  child: TextField(
                    controller: codeController,
                    focusNode: focusNodes[index],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24),
                    decoration: const InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.pink),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.pink),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        focusNodes[index + 1].requestFocus();
                      }
                      if (index > 0 && value.isEmpty) {
                        focusNodes[index - 1].requestFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: resendCode,
              child: const  Text('You didn\'t receive the pin code? Resend', style: TextStyle(color: AppColor.red)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleSubmit,
              child: Text('Next'),
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.red, padding: const EdgeInsets.symmetric(horizontal: 80)),
            ),
          ],
        ),
      ),
    );
  }
}