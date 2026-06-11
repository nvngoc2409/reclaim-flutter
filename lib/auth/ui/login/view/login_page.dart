import 'package:bloc_effects/bloc_effects.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reclaim/app/app.dart';
import 'package:reclaim/auth/auth.dart';
import 'package:reclaim/home/ui/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginCubit _bloc = getIt<LoginCubit>();

  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEffectListener<LoginCubit, LoginStateEffect>(
      effector: _bloc,
      listener: (context, state) {
        switch (state) {
          case LoginStateEffectSuccess():
            context.loadingOverlay.hide();
            context.goNamed(HomePage.routeName);
          case LoginStateEffectError(:final errorMessage):
            context.loadingOverlay.hide();
            showReclaimAlertDialog(context, title: 'Oops,', content: errorMessage);
          case LoginStateEffectLoading():
            context.loadingOverlay.show();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: ReclaimSpacing.large),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _emailFormKey,
                    child: ReclaimTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      initialValue: 'habbot.phan@gmail.com',
                      validator: _valilidateEmail,
                    ),
                  ),
                  const SizedBox(height: ReclaimSpacing.large),
                  Form(
                    key: _passwordFormKey,
                    child: ReclaimTextFormField(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      validator: _validatePassword,
                      initialValue: '1234',
                    ),
                  ),
                  const SizedBox(height: ReclaimSpacing.extraLarge),
                  SizedBox(
                    width: double.infinity,
                    child: ReclaimPrimaryButton.large(
                      title: 'Login',
                      onPressed: _onLoginPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() {
    FocusScope.of(context).unfocus();
    if (_emailFormKey.currentState!.validate() && _passwordFormKey.currentState!.validate()) {
      _bloc.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  String? _valilidateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
