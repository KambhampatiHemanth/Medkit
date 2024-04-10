import 'package:flutter/material.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();
    final TextEditingController PasswordController = TextEditingController();
    final TextEditingController Re_Enter_PasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Set New Password'),
      ),
      body: Center(
        child: Container(
          color: Colors.white10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: otpController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter OTP',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: PasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter New Password',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: Re_Enter_PasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Re-Enter New Password',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add logic to verify the OTP and set the new password
                    // After successful password reset, navigate back to the login screen.
                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text('Set New Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
