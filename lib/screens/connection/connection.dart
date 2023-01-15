import 'package:flutter/material.dart';

class Connection extends StatelessWidget {
  Connection({super.key});

  // Key for the form
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

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
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email'
                  ),
                ),
                // Field of the password
                TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.length < 6) {
                      return 'Please enter a correct password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password'
                  ),
                ),
                // Validation Form
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    print('je me connecte');
                    
                  }
                }, 
                child: const Text("Sign in")),
                const Text('New on My Mood? Create an account')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
