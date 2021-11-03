import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dd/common/api/auth_webclient.dart';
import 'package:project_dd/common/bloc/authBloc/auth_bloc.dart';
import 'package:project_dd/common/bloc/authBloc/auth_event.dart';
import 'package:project_dd/common/bloc/authBloc/auth_state.dart';
import 'package:project_dd/common/data/store.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/util/app_routes.dart';

enum AuthMode {
  Signup,
  Login,
}

class LoginPageContainer extends StatelessWidget {
  const LoginPageContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcccbcb),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Project D&D',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.purplePrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/login_icon.png',
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  try {
                    if (state is SignUpFetchingState) {
                      setState(() {
                        isLoading = true;
                      });
                    }
                    if (state is SignUpFetchedState) {
                      setState(() {
                        isLoading = false;
                        context.read<AuthBloc>().add(SignInFetchEvent(_authData['email'], _authData['password']));
                      });
                    }
                    if (state is SignInFetchingState) {
                      setState(() {
                        isLoading = true;
                      });
                    }
                    if (state is SignInFetchedState) {
                      setState(() {
                        isLoading = false;
                        Store.saveMap('userData', {
                          'auth': state.auth,
                          'expiryDate': DateTime.now().add(Duration(seconds: int.parse(state.auth.expiresIn))).toIso8601String(),
                        });
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.LOGIN_OR_HOME,
                        );
                      });
                    }
                    if (state is AuthErrorState) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: Text('Error!'),
                            content: Text(state.cause.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } catch (error) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: Text('Error!'),
                          content: Text('Unexpected error.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            readOnly: isLoading,
                            cursorColor: AppColors.purplePrimary,
                            scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: InputDecoration(
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.purplePrimary,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.purplePrimary,
                                  width: 2,
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: AppColors.purplePrimary,
                              ),
                            ),
                            style: TextStyle(color: AppColors.purplePrimary),
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                            validator: (value) {
                              final email = value ?? '';
                              if (email.trim().isEmpty || !email.contains('@')) {
                                return 'Invalid Email!';
                              }
                              return null;
                            }),
                        SizedBox(height: 4),
                        TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            readOnly: isLoading,
                            cursorColor: AppColors.purplePrimary,
                            scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: InputDecoration(
                              fillColor: Colors.white.withOpacity(0.5),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.purplePrimary,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.purplePrimary,
                                  width: 2,
                                ),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: AppColors.purplePrimary,
                              ),
                            ),
                            style: TextStyle(color: AppColors.purplePrimary),
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                            validator: (value) {
                              final password = value ?? '';
                              if (password.isEmpty || password.length <= 5) {
                                return 'Invalid Password!';
                              }
                              return null;
                            }),
                        SizedBox(height: 4),
                        isSignup
                            ? TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                readOnly: isLoading,
                                cursorColor: AppColors.purplePrimary,
                                scrollPadding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: InputDecoration(
                                  fillColor: Colors.white.withOpacity(0.5),
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.purplePrimary,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.purplePrimary,
                                      width: 2,
                                    ),
                                  ),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                    color: AppColors.purplePrimary,
                                  ),
                                ),
                                style: TextStyle(color: AppColors.purplePrimary),
                                validator: isLogin
                                    ? null
                                    : (value) {
                                        final password = value ?? '';
                                        if (password != _passwordController.text) {
                                          return 'Passwords do not match!';
                                        }
                                        return null;
                                      },
                              )
                            : Container(),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            !isLoading
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.purplePrimary,
                                      elevation: 0,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      _switchAuthMode();
                                    },
                                    child: Text(
                                      isLogin ? 'Register' : 'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              width: 8,
                            ),
                            !isLoading
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.purplePrimary,
                                      elevation: 0,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () => _submit(),
                                    child: Text(
                                      isLogin ? 'Login' : 'Confirm',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 8, top: 10, bottom: 10),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.purplePrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    _formKey.currentState?.save();

    if (isLogin) {
      context.read<AuthBloc>().add(SignInFetchEvent(_authData['email'], _authData['password']));
    } else {
      context.read<AuthBloc>().add(SignUpFetchEvent(_authData['email'], _authData['password']));
    }
  }

  _switchAuthMode() {
    setState(() {
      if (isLogin) {
        _authMode = AuthMode.Signup;
      } else {
        _authMode = AuthMode.Login;
      }
    });
  }

  bool get isLogin => _authMode == AuthMode.Login;
  bool get isSignup => _authMode == AuthMode.Signup;
}
