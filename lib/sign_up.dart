import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'User_login.dart';

void main() => runApp(const Sign_UpApp());

class Sign_UpApp extends StatelessWidget {
  const Sign_UpApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Sign_UpScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Sign_UpScreen extends StatelessWidget {
  const Sign_UpScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 800,
          child: Container(
            child: Sign_UpForm(),
          ),
        ),
      ),
    );
  }
}

class Sign_UpForm extends StatefulWidget {
  const Sign_UpForm();

  @override
  State<Sign_UpForm> createState() => _Sign_UpFormState();
}

class _Sign_UpFormState extends State<Sign_UpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _mobile = '';
  String _password = '';
  String _confirmpassword = '';

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // You can send the data to your backend or authentication service here.
      // Implement your API call or database operation.
      // For simplicity, we'll just print the data for now.
      print('Name: $_name');
      print('Email: $_email');
      print('Mobile: $_mobile');
      print('Password: $_password');
      print('Confirm Password: $_confirmpassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agent Signup'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email ID',
                ),
                validator: (value) {
                  if ((value?.isEmpty ?? true) ||
                      (!(value?.contains('@') ?? false))) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Mobile Number',
                ),
                keyboardType: TextInputType.number, // Set numeric keyboard
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 10,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your mobile number';
                  } else if (value!.length != 10) {
                    return 'Mobile number must have exactly 10 digits';
                  }
                  return null;
                },
                onSaved: (value) {
                  _mobile = value!;
                },
                // Remove character count indicator ("10/10") below the field
                buildCounter: (BuildContext context,
                        {int? currentLength,
                        int? maxLength,
                        bool? isFocused}) =>
                    null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if ((value?.isEmpty ?? true) || ((value?.length ?? 0) < 6)) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if ((value?.isEmpty ?? true) || ((value?.length ?? 0) < 6)) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if ((value?.isEmpty ?? true) || ((value?.length ?? 0) < 6)) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmpassword = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => User_LoginApp(),
                      ));
                },
                child: const Text("Sign Up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
