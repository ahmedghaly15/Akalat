import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum AuthMode { signUp, login }

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode authMode = AuthMode.login;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool passVisiblity = true;
  bool confirmPassVisiblity = true;
  final Map<String, String> _authData = {
    'email': '',
    'pass': '',
  };

// ======================== Switch Auth Mode (Sign in / Sign up) Function =============================
  void _switchAuthMode() {
    if (authMode == AuthMode.login) {
      setState(() {
        authMode = AuthMode.signUp;
      });
    } else {
      setState(() {
        authMode = AuthMode.login;
      });
    }
  }

// ======================== Submit (log in / sign up) data Function =============================
  void _signInOrSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Validating User Data
    _formKey.currentState!.save();

    // ==================== Log in Mode ====================
    if (authMode == AuthMode.login) {
      try {
        // Signinig in using Firebase Auth
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text, password: _passController.text);

        // Navigating to TabsScreen
        Get.off(const TabsScreen(), transition: Transition.fadeIn);
      }

      // Handling Errors
      on FirebaseAuthException catch (error) {
        if (error.code == 'user-not-found') {
          buildDialog("Incorrect email");
        } else if (error.code == 'wrong-password') {
          buildDialog("Incorrect Password");
        }
      }
    }

    // ==================== Sign up Mode ====================
    else if (authMode == AuthMode.signUp) {
      try {
        // Signing up using Firebase Auth
        if (_passController.text == _confirmPassController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passController.text);

          // Navigating to TabsScreen
          Get.off(const TabsScreen(), transition: Transition.fadeIn);
        }
      }

      // Handling Errors
      on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          buildDialog("Password is too weak");
        } else if (e.code == 'email-already-in-use') {
          buildDialog("Account already exists");
        }
      }
    }

    // Saving User's Info Using SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mail', _authData['email']!);
  }

  @override
  Widget build(BuildContext context) {
    // ======================== Screen Content =============================
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ======================== Logo =============================
                Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 30),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 110, 0),
                    radius: 125,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/Logo/cheff logo.png'),
                      radius: 120,
                    ),
                  ),
                ),
                // ======================== Form =============================
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: double.infinity,
                  height: authMode == AuthMode.login ? 350 : 390,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // ======================== Email TextFormField =============================
                        buildTextFormField(
                          "Email",
                          false,
                          const Icon(Icons.email_rounded),
                          _emailController,
                          (val) {
                            if (val!.isEmpty || !val.contains('@')) {
                              return "Invalid E-mail";
                            }
                            return null;
                          },
                          TextInputType.emailAddress,
                          (val) {
                            _authData['email'] = val!;
                          },
                        ),
                        const SizedBox(height: 23.5),
                        // ======================== Password TextFormField =============================
                        buildTextFormField(
                          "Password",
                          passVisiblity,
                          IconButton(
                            onPressed: () {
                              setState(() {
                                passVisiblity = !passVisiblity;
                              });
                            },
                            icon: Icon(passVisiblity
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded),
                          ),
                          _passController,
                          (val) {
                            if (val!.isEmpty || val.length < 5) {
                              return "Password is too short";
                            }
                            return null;
                          },
                          TextInputType.visiblePassword,
                          (val) {
                            _authData['pass'] = val!;
                          },
                        ),
                        const SizedBox(height: 23.5),
                        // ======================== Confirm Password TextFormField =============================
                        if (authMode == AuthMode.signUp)
                          buildTextFormField(
                              "Confirm Password",
                              confirmPassVisiblity,
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    confirmPassVisiblity =
                                        !confirmPassVisiblity;
                                  });
                                },
                                icon: Icon(confirmPassVisiblity
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded),
                              ),
                              _confirmPassController,
                              authMode == AuthMode.signUp
                                  ? (val) {
                                      if (val!.isEmpty ||
                                          val != _passController.text) {
                                        return "Password don't match";
                                      }
                                      return null;
                                    }
                                  : null,
                              TextInputType.visiblePassword,
                              null),
                        const SizedBox(height: 20.0),
                        // ======================== (Log in - Sign up ) Button TextFormField =============================
                        ElevatedButton.icon(
                          onPressed: _signInOrSignup,
                          icon: const Icon(
                            Icons.login_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                          label: Text(
                            authMode == AuthMode.login ? 'Log in' : 'Sign up',
                            textAlign: TextAlign.center,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 110, 0),
                            ),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            elevation: MaterialStateProperty.all(10.0),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 80.0, vertical: 18.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              authMode == AuthMode.login
                                  ? "Don't have an account?"
                                  : "Already a member?",
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                letterSpacing: 0,
                              ),
                            ),
                            // ======================== (Sign in / Sign in) Button =============================
                            TextButton(
                              onPressed: _switchAuthMode,
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 4.0)),
                                textStyle: MaterialStateProperty.all(
                                  const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              child: Text(
                                authMode == AuthMode.login
                                    ? "Sign up"
                                    : "Sign in",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ======================== Build Error Dialog Function =============================
  void buildDialog(String content) {
    Get.defaultDialog(
      title: "Warning",
      titleStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 25,
            letterSpacing: 1,
          ),
      middleText: content,
      middleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      backgroundColor: const Color.fromARGB(255, 255, 120, 0),
      barrierDismissible: true,
      radius: 20,
    );
  }

// ======================== Build Text Form Field Function =============================
  TextFormField buildTextFormField(
    String label,
    bool obsecure,
    Widget icon,
    TextEditingController? passController,
    String? Function(String?)? validating,
    TextInputType keyboardType,
    Function(String?)? saving,
  ) {
    return TextFormField(
      controller: passController,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'RobotoCondenced',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        floatingLabelStyle:
            TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: icon,
        suffixIconColor: const Color.fromARGB(255, 255, 110, 0),
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.only(left: 10.0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 255, 110, 0))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 110, 0),
              width: 2,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
        fontFamily: 'RobotoCondensed',
        fontStyle: FontStyle.normal,
      ),
      keyboardType: keyboardType,
      obscureText: obsecure,
      validator: validating,
      onSaved: saving,
      obscuringCharacter: '•',
    );
  }
}
