import 'package:flutter/material.dart';
import 'package:my_mood/models/user_entity.dart';
import 'package:my_mood/screens/register/register.dart';

class Connection extends StatelessWidget {
  Connection({super.key});

  // Key for the form
  final _formKey = GlobalKey<FormState>();
  //Regex for the email
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  //Variable for the form
  String? _email;
  String? _password;
  //Services auth

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Mood"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Connexion"),
                // Field of the email
                TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !emailRegex.hasMatch(value)) {
                      return 'Please enter a correct email';
                    }
                    _email = value;
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'Enter your email', labelText: 'Email'),
                ),
                // Field of the password
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Please enter a correct password';
                    }
                    _password = value;
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                ),
                // Validation Form
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        UserEntity(email: _email, password: _password);
                      }
                    },
                    child: const Text("Sign in")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New on My Mood? '),
                    InkWell(
                      child: const Text('Create an account', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,)),
                      onTap: () => Navigator.pushNamed(context, '/Register')
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
