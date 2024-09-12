import 'package:flutter/material.dart';
import 'package:noitcua1/Login.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to both controllers
    _emailController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  // Validation logic for email and password
  void _validateInputs() {
    setState(() {
      // Validate email: it must contain '@gmail.com'
      String email = _emailController.text;
      isEmailValid = RegExp("@gmail.com").hasMatch(email);

      // Validate password: must be at least 8 characters
      String password = _passwordController.text;
      isPasswordValid = password.length >= 8;

      print('Email Valid: $isEmailValid');
      print('Password Valid: $isPasswordValid');
    });
  }

  @override
  void dispose() {
    // Dispose of the controllers to avoid memory leaks
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Noitcua',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              'Log In Page',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email Here',
                suffixIcon: Icon(
                  Icons.check_box,
                  color: isEmailValid ? Colors.orange : Colors.transparent, // Make icon transparent if invalid
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password Here',
                suffixIcon: Icon(
                  Icons.check_box,
                  color: isPasswordValid ? Colors.orange : Colors.transparent, // Make icon transparent if invalid
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to Register Page (Placeholder for functionality)
              },
              child: Text(
                'Register an account',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (isEmailValid && isPasswordValid)
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReverseAuctionHomePage()),
                      );
                    }
                  : null, // Disable the button if conditions are not met
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
