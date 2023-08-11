import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/widgets/customs/custom_button.dart';
import 'package:amazon_clone/widgets/customs/custom_textfield.dart';
import 'package:flutter/material.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth? _auth;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUp() {
    authService.signUp(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signIn() {
    authService.signIn(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Welcom to amazon',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signUp ? Colors.white : null,
                title: const Text(
                  'Create account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                  activeColor: GlobalVariables.secondaryColor,
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          textEditingController: _nameController,
                          hintText: 'Name',
                          icon: const Icon(Icons.person),
                        ),
                        CustomTextField(
                          textEditingController: _emailController,
                          hintText: 'Email',
                          icon: const Icon(Icons.email),
                        ),
                        CustomTextField(
                          textEditingController: _passwordController,
                          hintText: 'Password',
                          icon: const Icon(Icons.password),
                        ),
                        CustomButton(
                          text: 'Sign Up',
                          onClick: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUp();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signIn ? Colors.white : null,
                title: const Text(
                  'Sign-in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                  activeColor: GlobalVariables.secondaryColor,
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  color: Colors.white,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          textEditingController: _emailController,
                          hintText: 'Email',
                          icon: const Icon(Icons.email),
                        ),
                        CustomTextField(
                          textEditingController: _passwordController,
                          hintText: 'Password',
                          icon: const Icon(Icons.password),
                        ),
                        CustomButton(
                          text: 'Sign In',
                          onClick: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signIn();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              TextButton(
                onPressed: () => _dialogBuilder(context),
                child: const Text('dasd'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Basic dialog title'),
        content: const Text(
          'A dialog is a type of modal window that\n'
          'appears in front of app content to\n'
          'provide critical information, or prompt\n'
          'for a decision to be made.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
