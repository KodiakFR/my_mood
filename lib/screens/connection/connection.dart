import 'package:flutter/material.dart';
import 'package:my_mood/models/user_entity.dart';
import 'package:my_mood/viewModels/connection_vm.dart';

  // Key for the form
  final _formKey = GlobalKey<FormState>();
  //Regex for the email
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  //Variable for the form
  String? _email;
  String? _password;
  final ConnectionVM _connectionVM = ConnectionVM();

class Connection extends StatelessWidget {
const Connection({super.key});

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
                Text("Connexion", style: Theme.of(context).textTheme.headline4),
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        UserEntity user =
                            UserEntity(email: _email, password: _password);
                        //connexion avec email + mot de passe
                        dynamic result = await _connectionVM.auth(user);
                        if (result != null) {
                          Navigator.pushReplacementNamed(context, "/Home");
                          //si le UID n'existe pas en base créer un espace pour la personne.
                        } else {
                          // popup si la connexion ne se fait pas
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Connection error'),
                              content: const Text(
                                  'Password or email is wrong or your email exist.'),
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
                    child: const Text("Sign in")),
                // bouton connection google
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    _connectionVM.authWithGmail().then(
                      (value) {
                        if (value.user!.uid.isNotEmpty) {
                          Navigator.pushReplacementNamed(context, "/Home");
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Connection error'),
                              content: const Text(
                                  'Your connection with google failed.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                )
                              ],
                            ),
                          );
                        }
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('lib/IMG/google_icon.png'),
                        width: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Sign in with google",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New on My Mood? '),
                    InkWell(
                        child: const Text('Create an account',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            )),
                        onTap: () => Navigator.pushNamed(context, '/Register')),
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
