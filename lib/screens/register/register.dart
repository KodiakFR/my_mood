import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_mood/models/user_entity.dart';
import 'package:my_mood/viewModels/register_vm.dart';

// Key for the form
final _formKey = GlobalKey<FormState>();
//Regex for the email
final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
//Variable for the form
String? _email;
String? _password;
RegisterVM registerVM = RegisterVM();

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Mood")),
      body: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Register",
                      style: Theme.of(context).textTheme.headline4),
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
                  // Field of the password
                  TextFormField(
                    validator: (value) {
                      if (value != _password) {
                        return 'Password is different';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm your password',
                      labelText: 'Confirm Password',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        UserEntity user =
                            UserEntity(email: _email, password: _password);
                        dynamic result = await registerVM.createUser(user);
                        if (result is UserCredential) {
                          Navigator.pop(context);
                        } else if (result is String) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Register error'),
                              content: Text(result),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                )
                              ],
                            ),
                          );
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Register error'),
                              content: const Text(
                                  "Registration error, please try again "),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                )
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Register'),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
