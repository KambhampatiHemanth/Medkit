import 'package:flutter/material.dart';
import 'agent_signup.dart';
import 'main.dart';
import 'agent_homepage.dart';
import 'ForgotPassword.dart';

class AgentApp extends StatelessWidget {
  const AgentApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const AgentScreen(),
        '/main': (context) => const Myapp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class AgentScreen extends StatelessWidget {
  const AgentScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main');
          },
        ),
        title: const Text('Agent Login'),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Container(
            child: AgentForm(),
          ),
        ),
      ),
    );
  }
}

class AgentForm extends StatefulWidget {
  // Callback function to navigate to the login page
  const AgentForm();

  @override
  State<AgentForm> createState() => _AgentFormState();
}

class _AgentFormState extends State<AgentForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Replace this with your authentication logic
  bool _isAuthenticated = false;
  bool rememberUser = false; // Added rememberUser variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // Set the background color here
          color: Colors.white10, // Change this to your desired color
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assests/images/agent.png'),
                  SizedBox(height: 70),
                  TextFormField(
                    controller: _emailController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username or E-mail ID',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildRememberForgot(),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AgentDashboard(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                  if (_isAuthenticated)
                    const Text(
                      'Logged in as User',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AgentSignup(),
                        ),
                      );
                    },
                    child: const Text('Don\'t have an Account: Sign Up?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ForgotPasswordScreen(),
              ),
            ); // Add code to handle "I forgot my Password" here
          },
          child: _buildGreyText("I forgot my Password"),
        ),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }
}
